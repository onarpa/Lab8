pipeline {
    agent any

    environment {
        RESULTS_DIR = "results"
        TEST_DIR    = "tests"
    }

    stages {
        stage('Cleanup') {
            steps {
                echo "Cleaning old test results..."
                sh """
                  rm -rf ${RESULTS_DIR}
                  mkdir -p ${RESULTS_DIR}
                """
            }
        }

        stage('Environment Check (Non-blocking)') {
            steps {
                echo "Checking environment (for information only)..."
                sh 'python3 --version || true'
                sh 'robot --version || true'
                sh 'google-chrome --version || chromium --version || true'
            }
        }

        stage('Validate Test Directory') {
            steps {
                echo "Validating test directory..."
                sh """
                  if [ ! -d "${TEST_DIR}" ]; then
                    echo "Test directory '${TEST_DIR}' not found"
                    exit 1
                  fi
                """
            }
        }

        stage('Run Robot Tests (Headless Local)') {
            steps {
                echo "Running Robot Framework tests..."
                sh """
                  robot \
                    --outputdir ${RESULTS_DIR} \
                    --variable BROWSER:headlesschrome \
                    --settag student_run \
                    ${TEST_DIR}
                """
            }
        }
    }

    post {
        always {
            echo "Publishing Robot Framework results..."
            step([
                \$class: 'RobotPublisher',
                outputPath: "${RESULTS_DIR}",
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableReports: false,
                passThreshold: 100.0,
                unstableThreshold: 80.0
            ])
            archiveArtifacts artifacts: "${RESULTS_DIR}/**", allowEmptyArchive: true
        }
    }
}
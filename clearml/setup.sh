#!/bin/bash

echo "Running setup script."

cd $CLEARML_GIT_ROOT
export custom_python_path=`which python3`
rm -rf clearml
pip install clearml

cat > $CLEARML_CUSTOM_BUILD_OUTPUT << EOL
{
  "binary": "$custom_python_path",
  "entry_point": "$CLEARML_GIT_ROOT/$CLEARML_TASK_SCRIPT_ENTRY",
  "working_dir": "$CLEARML_GIT_ROOT/$CLEARML_TASK_WORKING_DIR"
}
EOL
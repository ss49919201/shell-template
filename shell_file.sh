#!/bin/bash

FILE=${1}

if [ -e $FILE ]; then
  echo "${1} is already exists."
  exit 1
fi

echo "#!/bin/bash" >> ${FILE}

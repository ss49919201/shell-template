#!/bin/bash

FILE=${1}

touch ${FILE}
echo "#!/bin/bash" > ${FILE}

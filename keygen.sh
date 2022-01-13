#!/bin/sh
KEYS_PATH=${KEYS_PATH:-/root/.ssh}
PRIVATE_KEY=$KEYS_PATH/id_rsa
PUBLIC_KEY=${PRIVATE_KEY}.pub

if [ ! -f "$PRIVATE_KEY" ]; then
  ssh-keygen -q -t rsa -N '' -f $PRIVATE_KEY
fi

echo "========= PUBLIC KEY ============"
cat $PUBLIC_KEY
echo "======= END PUBLIC KEY =========="

echo "========= PRIVATE KEY ============"
cat $PRIVATE_KEY
echo "======= END PRIVATE KEY =========="

exit 0
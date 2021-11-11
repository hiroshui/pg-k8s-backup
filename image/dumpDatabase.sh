DUMP_FILE_NAME="${PGDATABASE}-backupOn`date +%Y-%m-%d-%H-%M`.dump"
echo "Creating dump: ${DUMP_FILE_NAME}"

if [[ ! -d ${BACKUP_DIR} ]]; then
  echo -e "[WARN]: Target folder ${BACKUP_DIR} does not exist! Mount successful? Will be created only localy in container."
  mkdir -p "${BACKUP_DIR}"
fi

cd "${BACKUP_DIR}"


pg_dump -C -w --format=c --blobs > ${DUMP_FILE_NAME}

if [ $? -ne 0 ]; then
  rm ${DUMP_FILE_NAME}
  echo "Back up not created, check db connection settings"
  exit 1
fi

echo 'Successfully Backed Up'
exit 0

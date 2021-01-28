#!/bin/sh



sleep 10
echo starting...
pynonymizer -i ${DUMP_INPUT_FILE} -o ${DUMP_OUTPUT_FILE}  -t ${DB_TYPE} -s ${STRATEGY_FILE} -l ${LOCALE} --seed-rows ${SEED_ROWS} --verbose -d ${DB_HOST} -P ${DB_PORT} -n ${DB_NAME} -u ${DB_USER} -p ${DB_PASSWORD}

ls


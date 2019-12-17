-- must be idempotent

-- @gitpodDB contains name of the DB the script manipulates, 'gitpod' by default.
-- Prepend the script with "SET @gitpodDB = '`<db-name>`'" if needed otherwise
SET @gitpodDB = IFNULL(@gitpodDB, '`gitpod`');

SET @statementStr = CONCAT('DROP DATABASE IF EXISTS ', @gitpodDB);
PREPARE statement FROM @statementStr;
EXECUTE statement;

SET @statementStr = CONCAT('CREATE DATABASE ', @gitpodDB, ' CHARSET utf8mb4');
PREPARE statement FROM @statementStr;
EXECUTE statement;

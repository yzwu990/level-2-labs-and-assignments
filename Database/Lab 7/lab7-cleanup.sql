-- Cleanup for lab7

DROP PROCEDURE YanzhangUser.sp_checkInvalidPostalCode;
DROP PROCEDURE YanzhangUser.sp_checkInvalidTelephone;
DROP USER YanzhangUser CASCADE;
DROP USER testUser;
DROP ROLE applicationAdmin;
DROP ROLE applicationUser;
DROP TABLESPACE CST2355 INCLUDING CONTENTS AND DATAFILES;

-- End of File
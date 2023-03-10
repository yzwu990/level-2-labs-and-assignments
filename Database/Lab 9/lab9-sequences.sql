-- 1.2.1
-- ADDRESS sequence
CREATE SEQUENCE ADDRESS_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- CNAME sequence
CREATE SEQUENCE CNAME_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- CUSTOMER sequence
CREATE SEQUENCE CUSTOMER_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- CUSTOMER_ADDRESS sequence
CREATE SEQUENCE CUSTOMER_ADDRESS_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- CUSTOMER_NAME sequence
CREATE SEQUENCE CUSTOMER_NAME_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- CUSTOMER_TELEPHONE sequence
CREATE SEQUENCE CUSTOMER_TELEPHONE_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- PRODUCT sequence
CREATE SEQUENCE PRODUCT_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;


-- PRODUCT_RETAILLOCATION sequence
CREATE SEQUENCE PRODUCT_RETAILLOCATION_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- PURCHASE sequence
CREATE SEQUENCE PURCHASE_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- RETAILLOCATION sequence
CREATE SEQUENCE RETAILLOCATION_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- TELEPHONE sequence
CREATE SEQUENCE TELEPHONE_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;

-- UNDER18_CUSTOMERS sequence
CREATE SEQUENCE UNDER18_CUSTOMERS_LAB9_SEQ
    INCREMENT BY 1
    START WITH 100
    NOCACHE
    NOCYCLE;


-- 2.1 package
CREATE PACKAGE customer_pkg AS
    ID_TEL NUMBER :=TELEPHONE_LAB9_SEQ.nextval;
--     ID_CU NUMBER :=CUSTOMER_LAB9_SEQ.nextval;
    ID_CU_TEL NUMBER :=CUSTOMER_TELEPHONE_LAB9_SEQ.nextval;
    ID_ADD NUMBER :=ADDRESS_LAB9_SEQ.nextval;
    ID_CU_ADD NUMBER :=CUSTOMER_ADDRESS_LAB9_SEQ.nextval;
    ID_CNAME NUMBER :=CNAME_LAB9_SEQ.nextval;
    ID_CU_NAME NUMBER :=CUSTOMER_NAME_LAB9_SEQ.nextval;


    PROCEDURE change_telephone(ID_TEL IN NUMBER,TYPE_TEL IN VARCHAR2,
    TELNUM_TEL IN VARCHAR2,ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP, PWD_CUS IN VARCHAR2,
    ID_CU_TEL IN NUMBER);

    PROCEDURE  change_address(ID_ADD IN NUMBER, ST_ADD IN VARCHAR2, CITY_ADD IN VARCHAR2,
    PROVINVE_ADD IN VARCHAR2, POST_ADD IN VARCHAR2,ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP,
    PWD_CUS IN VARCHAR2, ID_CU_ADD IN NUMBER);

    PROCEDURE change_name(ID_CNAME IN NUMBER, FNAME_CNAME IN VARCHAR2,
    LNAME_CNAME IN VARCHAR2,ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP,
    PWD_CUS IN VARCHAR2, ID_CU_NAME IN NUMBER);

    FUNCTION new_customer(ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP,
    PWD_CUS IN VARCHAR2,ID_CNAME IN NUMBER, FNAME_CNAME IN VARCHAR2,
    LNAME_CNAME IN VARCHAR2,ID_CU_NAME IN NUMBER,ID_ADD IN NUMBER, ST_ADD IN VARCHAR2,
    CITY_ADD IN VARCHAR2, PROVINVE_ADD IN VARCHAR2, POST_ADD IN VARCHAR2,ID_CU_ADD IN NUMBER,
    ID_TEL IN NUMBER,TYPE_TEL IN VARCHAR2, TELNUM_TEL IN VARCHAR2,ID_CU_TEL IN NUMBER)
    RETURN INTEGER;

    FUNCTION get_age(ID_CUS IN NUMBER)
    RETURN INTEGER;

END customer_pkg;
/



-- 3.1.6
CREATE OR REPLACE PROCEDURE change_telephone(ID_TEL IN NUMBER,TYPE_TEL IN VARCHAR2,
    TELNUM_TEL IN VARCHAR2,ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP, PWD_CUS IN VARCHAR2,
    ID_CU_TEL IN NUMBER) AS
--     ID_TEL NUMBER :=TELEPHONE_LAB9_SEQ.nextval;
--     ID_CU NUMBER :=CUSTOMER_LAB9_SEQ.nextval;
--     ID_CU_TEL NUMBER :=CUSTOMER_TELEPHONE_LAB9_SEQ.nextval;
    EXISTCUTOMER NUMBER;
    NEW_ID_CU NUMBER :=CUSTOMER_LAB9_SEQ.nextval;

BEGIN
-- check customer exists in current table
    SELECT COUNT(*) INTO EXISTCUTOMER FROM CUSTOMER_TELEPHONE WHERE CUSTOMER_IDCUSTOMER = ID_CU;
    IF (EXISTCUTOMER=1) THEN
        UPDATE CUSTOMER_TELEPHONE SET ENDDATE = SYSDATE WHERE ENDDATE IS NULL AND CUSTOMER_IDCUSTOMER = ID_CU;
    end if;
-- insert into TELEPHONE
    INSERT INTO TELEPHONE VALUES (ID_TEL,TYPE_TEL,TELNUM_TEL);
    INSERT INTO CUSTOMER VALUES (NEW_ID_CU,BDATE_CUS,PWD_CUS);
    INSERT INTO CUSTOMER_TELEPHONE VALUES (ID_CU_TEL,SYSDATE,NULL,NEW_ID_CU,ID_TEL);
END;
/

-- ADDRESS
CREATE OR REPLACE PROCEDURE change_address(ID_ADD IN NUMBER, ST_ADD IN VARCHAR2, CITY_ADD IN VARCHAR2,
    PROVINVE_ADD IN VARCHAR2, POST_ADD IN VARCHAR2,ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP,
    PWD_CUS IN VARCHAR2, ID_CU_ADD IN NUMBER) AS
--     ID_ADD NUMBER :=ADDRESS_LAB9_SEQ.nextval;
    EXISTCUTOMER NUMBER;
    NEW_ID_CU NUMBER :=CUSTOMER_LAB9_SEQ.nextval;

BEGIN
-- check customer exists in current table
    SELECT COUNT(*) INTO EXISTCUTOMER FROM CUSTOMER_ADDRESS WHERE CUSTOMER_IDCUSTOMER = ID_CU;
    IF (EXISTCUTOMER=1) THEN
        UPDATE CUSTOMER_ADDRESS SET ENDDATE = SYSDATE WHERE ENDDATE IS NULL AND CUSTOMER_IDCUSTOMER = ID_CU;
    end if;
-- insert into ADDRESS
    INSERT INTO ADDRESS VALUES (ID_ADD,ST_ADD,CITY_ADD,PROVINVE_ADD,POST_ADD);
    INSERT INTO CUSTOMER VALUES (NEW_ID_CU,BDATE_CUS,PWD_CUS);
    INSERT INTO CUSTOMER_ADDRESS VALUES (ID_CU_ADD,SYSDATE,NULL,NEW_ID_CU,ID_ADD);
END;
/

-- insert into NAME
CREATE OR REPLACE PROCEDURE change_name(ID_CNAME IN NUMBER, FNAME_CNAME IN VARCHAR2,
    LNAME_CNAME IN VARCHAR2,ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP,
    PWD_CUS IN VARCHAR2, ID_CU_NAME IN NUMBER) AS
-- ID_CNAME NUMBER :=CNAME_LAB9_SEQ.nextval;
    EXISTCUTOMER NUMBER;
    NEW_ID_CU NUMBER :=CUSTOMER_LAB9_SEQ.nextval;
BEGIN
-- check customer exists in current table
    SELECT COUNT(*) INTO EXISTCUTOMER FROM CUSTOMER_NAME WHERE CUSTOMER_IDCUSTOMER = ID_CU;
    IF (EXISTCUTOMER=1) THEN
        UPDATE CUSTOMER_NAME SET ENDDATE = SYSDATE WHERE ENDDATE IS NULL AND CUSTOMER_IDCUSTOMER = ID_CU;
    end if;
-- insert into NAME
    INSERT INTO CNAME VALUES (ID_CNAME,FNAME_CNAME,LNAME_CNAME);
    INSERT INTO CUSTOMER VALUES (NEW_ID_CU,BDATE_CUS,PWD_CUS);
    INSERT INTO CUSTOMER_ADDRESS VALUES (ID_CU_NAME,SYSDATE,NULL,NEW_ID_CU,ID_CNAME);
END;
/

-- 3.1.7

CREATE OR REPLACE FUNCTION new_customer(ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP,
    PWD_CUS IN VARCHAR2,ID_CNAME IN NUMBER, FNAME_CNAME IN VARCHAR2,
    LNAME_CNAME IN VARCHAR2,ID_CU_NAME IN NUMBER,ID_ADD IN NUMBER, ST_ADD IN VARCHAR2,
    CITY_ADD IN VARCHAR2, PROVINVE_ADD IN VARCHAR2, POST_ADD IN VARCHAR2,ID_CU_ADD IN NUMBER,
    ID_TEL IN NUMBER,TYPE_TEL IN VARCHAR2, TELNUM_TEL IN VARCHAR2,ID_CU_TEL IN NUMBER)
    RETURN NUMBER
    AS
    BEGIN
        -- NAME
        IF (FNAME_CNAME IS NOT NULL) OR (LNAME_CNAME IS NOT NULL) THEN
        change_name(ID_CNAME, FNAME_CNAME ,LNAME_CNAME,
            ID_CU, BDATE_CUS,PWD_CUS, ID_CU_NAME);
        END IF;

        -- ADDRESS
        IF (ST_ADD IS NOT NULL) OR (CITY_ADD IS NOT NULL) OR
           (PROVINVE_ADD IS NOT NULL) OR (POST_ADD IS NOT NULL) THEN
        change_address(ID_ADD, ST_ADD, CITY_ADD,
            PROVINVE_ADD, POST_ADD,ID_CU,
            BDATE_CUS,PWD_CUS, ID_CU_ADD);
        END IF;


        -- TELEPHONE
        IF(TYPE_TEL IS NOT NULL) OR (TELNUM_TEL IS NOT NULL) THEN
        change_telephone(ID_TEL,TYPE_TEL,TELNUM_TEL,
            ID_CU, BDATE_CUS, PWD_CUS,ID_CU_TEL);
        END IF;

        RETURN ID_CU;
END;


-- 3.1.8
CREATE OR REPLACE FUNCTION get_age(ID_CU IN NUMBER, BDATE_CUS IN TIMESTAMP)
    RETURN NUMBER
    AS
    AGE NUMBER;
    BEGIN
    SELECT trunc(months_between(SYSDATE, BDATE_CUS)/12) INTO AGE FROM CUSTOMER WHERE IDCUSTOMER=ID_CU;
    RETURN AGE;
END;










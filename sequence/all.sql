-- SEQUENCE TABEL MASTER

CREATE SEQUENCE PaymentTypeId
   AS INT
   START WITH 5
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE AdminRoleId
   AS INT
   START WITH 4
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE TrashTypeId
   AS INT
   START WITH 6
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

-- SEQUENCE TABEL MASTER YANG DIGENERATE

CREATE SEQUENCE AdminId
   AS INT
   START WITH 1151
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE CustomerId
   AS INT
   START WITH 20001
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE TrashCollectorId
   AS INT
   START WITH 101
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE LocationId
   AS INT
   START WITH 1001
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE GarbageCenterId
   AS INT
   START WITH 51
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

-- SEQUENCE TABEL TRANSAKSI

CREATE SEQUENCE TransactionId
   AS INT
   START WITH 1203797
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE TransactionItemId
   AS INT
   START WITH 2406411
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE ReportId
   AS INT
   START WITH 1
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE ReportItem
   AS INT
   START WITH 1
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE TrashSaleId
   AS INT
   START WITH 1579
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;

CREATE SEQUENCE TrashSaleItemId
   AS INT
   START WITH 2367
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 999999999
   NO CYCLE
   CACHE 10;
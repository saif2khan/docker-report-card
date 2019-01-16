CREATE TABLE metabase.temptable(
   InspectionID      INTEGER  NOT NULL
  ,District          VARCHAR(20)
  ,Block             VARCHAR(30)
  ,Designation       VARCHAR(50)
  ,Name_of_inspector VARCHAR(30)
  ,InspectionPlan    VARCHAR(80)
  ,InspectionDate    DATE
  ,UdiseCode         INTEGER
  ,SchoolName        VARCHAR(30)
  ,Question      VARCHAR(150)
  ,Observation   VARCHAR(100)
);

CREATE TABLE metabase.shikshaSaathi(
InspectionID      INTEGER  NOT NULL
  ,District          VARCHAR(20)
  ,Block             VARCHAR(30)
  ,Designation       VARCHAR(50)
  ,Name_of_inspector VARCHAR(30)
  ,InspectionPlan    VARCHAR(80)
  ,InspectionDate    DATE
  ,UdiseCode         INTEGER
  ,SchoolName        VARCHAR(30)
  ,Question      VARCHAR(150)
  ,Observation   VARCHAR(100)
);


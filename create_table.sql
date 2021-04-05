DROP TABLE IF EXISTS tokyo;
CREATE TABLE tokyo (
  gid SERIAL PRIMARY KEY,
  building_id varchar(255),
  wkb_geometry GEOMETRY('POLYGON', 6668),
  height numeric(24,15)
);

ALTER TABLE tokyo ADD COLUMN id varchar;
UPDATE tokyo SET id = gid::text;
ALTER TABLE tokyo ADD COLUMN  geom_triangle geometry;
ALTER TABLE tokyo ADD COLUMN style json;
ALTER TABLE tokyo ADD COLUMN shaders json;
UPDATE tokyo SET style = ('{ "walls": "#EEC900", "roof":"#FF0000", "floor":"#008000"}');

#!/bin/sh
PGPASSWORD=postgres psql -U postgres -h localhost < create_table.sql
./citygml2pgsql.py 53393503_bldg_6697_op2.gml 53393504_bldg_6697_op2.gml 53393505_bldg_6697_op2.gml 53393506_bldg_6697_op2.gml 53393507_bldg_6697_op2.gml 53393508_bldg_6697_op2.gml 1 6697 wkb_geometry building_id tokyo | PGPASSWORD=postgres psql -U postgres -h localhost
PGPASSWORD=postgres psql -U postgres -h localhost < update_table.sql
docker run -it --network mynetwork bertt/tesselate_building -h some-postgis -U postgres -d postgres -f mapbox -t tokyo -i wkb_geometry -o geom_triangle --idcolumn gid --stylecolumn style --shaderscolumn shaders
docker run -v $(pwd)/output:/app/output -it --network mynetwork geodan/pg2b3dm -h some-postgis -U postgres -c geom_triangle -t tokyo -d postgres -i id --shaderscolumn shaders
-- Tags: no-fasttest

SELECT h3ToGeo(644325524701193974) SETTINGS h3togeo_lon_lat_result_order=true;
SELECT h3ToGeo(644325524701193974) SETTINGS h3togeo_lon_lat_result_order=false;

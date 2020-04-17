# Defined in - @ line 0
function proj --description 'alias proj=python -c "import sys, gdal; ds=gdal.Open(sys.argv[1]); prj=ds.GetProjection(); print(prj);"'
	python -c "import sys, gdal; ds=gdal.Open(sys.argv[1]); prj=ds.GetProjection(); print(prj);" $argv;
end

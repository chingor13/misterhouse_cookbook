# use runit to create an daemon script
include_recipe "runit"

runit_service "misterhouse"

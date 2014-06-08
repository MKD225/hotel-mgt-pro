<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<script type="text/javascript">
function createMenu(theme){
            var data = [{
                "id": "1",
                "text": "Home",
                "parentid": "-1",
                "path": "/hotel/home"
            }, {
            	"id": "2",
                "text": "Hotel Member",
                "parentid": "-1",
                "subMenuWidth": '200px'
            }, {
                "id": "3",
                "text": "Guest",
                "parentid": "2",
                "path": "/hotel/guest/home"
            }, {
                "id": "30",
                "text": "Search Members",
                "parentid": "2",
                "path": "/slia/members"
            }, {
            	"id": "4",
            	"text": "Manager",
                "parentid": "-1",
                "path": "/slia/login"
            }, {
            	"id": "5",
            	"text": "Discount",
                "parentid": "4",
                "path": "/hotel/discount/home"
            }, {
            	"id": "7",
            	"text": "Agent",
                "parentid": "2",
                "path": "/hotel/agent/home"
            }, {
            	"id": "8",
            	"text": "Reservation Type",
                "parentid": "2",
                "path": "/hotel/resevationtype/home"
            }, {
            	"id": "9",
            	"text": "Room Type",
                "parentid": "2",
                "path": "/hotel/roomtype/home"
            }, {
            	"id": "10",
            	"text": "Spouse",
                "parentid": "2",
                "path": "/hotel/spouse/home"
            }, {
            	"id": "12",
            	"text": "Room",
                "parentid": "4",
                "path": "/hotel/room/home"
            }, {
                "id": "14",
                "text": "Roomcalander",
                "parentid": "2",
                "path": "/hotel/roomcalander/home"
            }];
            var source = {
                datatype: "json",
                datafields: [{
                    name: 'id'
                }, {
                    name: 'parentid'
                }, {
                    name: 'text'
                }, {
                    name: 'subMenuWidth'
                }, {
                    name: 'path'
                }],
                id: 'id',
                localdata: data
            };

            // create data adapter.
            var dataAdapter = new $.jqx.dataAdapter(source);
            dataAdapter.dataBind();
            var records = dataAdapter.getRecordsHierarchy('id', 'parentid', 'items', [{
                name: 'text',
                map: 'label'
            }],'path');
            
            $('#jqxMenu').jqxMenu({
                source: records,
                width: '100%',
                height: '35px',
                theme: theme
            });

            $("#jqxMenu").on('itemclick', function (event) {
				var id = event.args.id;
                var path;
                var recursion = function (object) {
                    for (var i = 0; i < object.length; i++) {
                        if (id == object[i].id) {
                        	path = object[i].path;
                            break;
                        } else if (object[i].items) {
                            recursion(object[i].items);
                        };
                    };
                };
                recursion(records);
                console.info(path);
                if(path != null)
                	window.location = path;
            });
}
</script>

<div class="header">
	<div id='content'>
		<div id='jqxMenu'></div>
	</div>
</div>
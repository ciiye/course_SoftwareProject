webpackJsonp([1,8,19,25,26],{297:function(e,t,a){function n(e){a(511)}var i=a(2)(a(437),a(520),n,"data-v-2bf29555",null);e.exports=i.exports},298:function(e,t,a){var n=a(2)(a(438),a(522),null,null,null);e.exports=n.exports},299:function(e,t,a){function n(e){a(512)}var i=a(2)(a(439),a(521),n,null,null);e.exports=i.exports},300:function(e,t,a){var n=a(2)(a(440),a(523),null,null,null);e.exports=n.exports},318:function(e,t,a){var n=a(2)(a(562),a(853),null,null,null);e.exports=n.exports},340:function(e,t,a){"use strict";function n(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"记录",t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"永久删除";return new l.a(function(n,i){o.MessageBox.confirm("此操作将"+t+e+", 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){n()}).catch(function(){a.i(o.Message)({type:"info",message:"已取消此操作"})})})}t.a=n;var i=a(26),l=a.n(i),o=a(37);a.n(o)},401:function(e,t,a){"use strict";t.__esModule=!0;var n=a(441),i=function(e){return e&&e.__esModule?e:{default:e}}(n);t.default=function(e){if(Array.isArray(e)){for(var t=0,a=Array(e.length);t<e.length;t++)a[t]=e[t];return a}return(0,i.default)(e)}},437:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={data:function(){return{roleId:null,resourceLoading:!1,resourceVisible:!1,formResourceSubmiting:!1,resourceData:[],checkedResourceIds:[],resourceActiveName:"0",resourceActiveIndex:0}},methods:{getRoleResource:function(e){var t=this;this.resourceVisible=!0,this.resourceLoading=!0,this.roleId=e,this.$api.system.role.getResource({data:{id:this.roleId}}).then(function(e){t.resourceData=e.data.data.list,t.checkedResourceIds=e.data.data.checked.map(function(e){return parseInt(e)}),t.resourceLoading=!1}).catch(function(e){t.resourceLoading=!1,console.log(e)})},commitResourceForm:function(){var e=this;this.formResourceSubmiting=!0,this.$api.system.role.savePrivilege({data:{roleId:this.roleId,resourceType:1,resourceIds:this.checkedResourceIds}}).then(function(t){e.formResourceSubmiting=!1,e.resourceVisible=!1,e.$notify({title:"成功",message:"保存成功",type:"success",duration:1500}),console.log(t)}).catch(function(t){e.formResourceSubmiting=!1,e.$notify({title:"错误",message:t,type:"error",duration:3e3}),console.log(t)})}}}},438:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={data:function(){return{roleId:null,menuLoading:!1,menuVisible:!1,formMenuSubmiting:!1,menuData:[],expandedKeys:[],checkedKeys:[],defaultProps:{children:"children",label:"title"}}},methods:{getRoleMenu:function(e){var t=this;this.menuVisible=!0,this.menuLoading=!0,this.roleId=e,this.$api.system.role.getMenu({data:{id:this.roleId}}).then(function(e){t.checkedKeys=e.data.data.checkedKeys,t.expandedKeys=e.data.data.expandedKeys,t.menuData=e.data.data.list,t.menuLoading=!1}).catch(function(e){t.menuLoading=!1,console.log(e)})},commitMenuForm:function(){var e=this;this.formMenuSubmiting=!0,this.$api.system.role.savePrivilege({data:{roleId:this.roleId,resourceType:0,resourceIds:this.$refs.tree.getCheckedKeys()}}).then(function(t){e.formMenuSubmiting=!1,e.menuVisible=!1,e.$notify({title:"成功",message:"保存成功",type:"success",duration:1500}),console.log(t)}).catch(function(t){e.formMenuSubmiting=!1,e.$notify({title:"错误",message:t,type:"error",duration:3e3}),console.log(t)})}}}},439:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=a(401),i=a.n(n);t.default={name:"TreeTable",props:{tableData:{type:Array,default:function(){return null}}},filters:{statusFilter:function(e){return{0:"success",1:"danger"}[e]},statusMap:function(e){return{0:"正常",1:"停用"}[e]},typeFilter:function(e){return{0:"gray",1:"primary"}[e]},typeMap:function(e){return{0:"成员",1:"群组"}[e]}},computed:{tableLoading:function(){return null==this.tableData}},methods:{expandTable:function(e){var t,a=this.tableData.map(function(e){return e.id}),n=a.indexOf(e);this.tableData[n].isExpand=!0,n+1==a.length?this.tableData[n].nextId=-1:this.tableData[n].nextId=this.tableData[n+1].id,(t=this.tableData).splice.apply(t,[n+1,0].concat(i()(this.tableData[n].children)))},foldTable:function(e){var t=this.tableData.map(function(e){return e.id}),a=t.indexOf(e);if(this.tableData[a].isExpand=!1,-1==this.tableData[a].nextId)this.tableData.splice(a+1);else{var n=t.indexOf(this.tableData[a].nextId);this.tableData.splice(a+1,n-a-1)}},emitRoleManage:function(e,t){this.$emit("manage",e,t)},emitRoleUpdate:function(e){this.$emit("update",e)},emitRoleDelete:function(e){this.$emit("delete",e)},emitRoleCreate:function(e){this.$emit("create",e)}}}},440:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={data:function(){return{roleId:null,userLoading:!1,userVisible:!1,formUserSubmiting:!1,userData:[],userModel:[]}},methods:{getRoleUser:function(e){var t=this;this.userData=[],this.userModel=[],this.userVisible=!0,this.userLoading=!0,this.roleId=e,this.$api.system.role.getUser({data:{id:this.roleId}}).then(function(e){var a=e.data.data.all;for(var n in a)t.userData.push({key:parseInt(a[n].userId),label:a[n].userName});var i=e.data.data.right;for(var l in i)t.userModel.push(parseInt(i[l].userId));t.userLoading=!1}).catch(function(e){t.userLoading=!1,console.log(e)})},commitUserForm:function(){var e=this;this.formUserSubmiting=!0,this.$api.system.role.saveUser({data:{id:this.roleId,list:this.userModel}}).then(function(t){e.formUserSubmiting=!1,e.userVisible=!1,e.$notify({title:"成功",message:"保存成功",type:"success",duration:1500}),console.log(t)}).catch(function(t){e.formUserSubmiting=!1,e.$notify({title:"错误",message:t,type:"error",duration:3e3}),console.log(t)})}}}},441:function(e,t,a){e.exports={default:a(447),__esModule:!0}},447:function(e,t,a){a(65),a(449),e.exports=a(6).Array.from},448:function(e,t,a){"use strict";var n=a(12),i=a(29);e.exports=function(e,t,a){t in e?n.f(e,t,i(0,a)):e[t]=a}},449:function(e,t,a){"use strict";var n=a(28),i=a(11),l=a(38),o=a(119),r=a(118),s=a(64),u=a(448),c=a(121);i(i.S+i.F*!a(120)(function(e){Array.from(e)}),"Array",{from:function(e){var t,a,i,d,f=l(e),m="function"==typeof this?this:Array,p=arguments.length,b=p>1?arguments[1]:void 0,h=void 0!==b,g=0,v=c(f);if(h&&(b=n(b,p>2?arguments[2]:void 0,2)),void 0==v||m==Array&&r(v))for(t=s(f.length),a=new m(t);t>g;g++)u(a,g,h?b(f[g],g):f[g]);else for(d=v.call(f),a=new m;!(i=d.next()).done;g++)u(a,g,h?o(d,b,[i.value,g],!0):i.value);return a.length=g,a}})},450:function(e,t,a){t=e.exports=a(295)(!1),t.push([e.i,".panel-menu-item[data-v-2bf29555]{width:90%;max-height:60px;border-radius:5px;display:inline-block;margin:10px 10px 10px 0}.panel-menu-item-title[data-v-2bf29555]{float:left;padding:5px;margin-right:10px;border-right:1px solid #20a0ff}.el-checkbox-group[data-v-2bf29555]{display:inline;margin:5px}",""])},451:function(e,t,a){t=e.exports=a(295)(!1),t.push([e.i,".tree-indent{display:inline-block;width:16px;height:25px;vertical-align:top;overflow:hidden}.expand-icon{position:relative;cursor:pointer;color:#666;transition:transform .2s ease-in-out;width:16px;height:25px}.el-table__expanded-cell{padding:0 0 0 49px!important}",""])},511:function(e,t,a){var n=a(450);"string"==typeof n&&(n=[[e.i,n,""]]),n.locals&&(e.exports=n.locals);a(296)("a9477674",n,!0)},512:function(e,t,a){var n=a(451);"string"==typeof n&&(n=[[e.i,n,""]]),n.locals&&(e.exports=n.locals);a(296)("32c1fc30",n,!0)},520:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{directives:[{name:"loading",rawName:"v-loading.body",value:e.resourceLoading,expression:"resourceLoading",modifiers:{body:!0}}],attrs:{title:"角色资源管理",visible:e.resourceVisible,"element-loading-text":"玩命加载中"},on:{"update:visible":function(t){e.resourceVisible=t}}},[a("el-tabs",{model:{value:e.resourceActiveName,callback:function(t){e.resourceActiveName=t},expression:"resourceActiveName"}},e._l(e.resourceData,function(t,n){return a("el-tab-pane",{key:n,attrs:{label:t.title,name:String(n)}},e._l(t.children,function(t,n){return a("div",{key:n,staticClass:"panel-menu-item"},[a("span",{staticClass:"panel-menu-item-title"},[e._v(e._s(t.title))]),e._v(" "),a("el-checkbox-group",{model:{value:e.checkedResourceIds,callback:function(t){e.checkedResourceIds=t},expression:"checkedResourceIds"}},e._l(t.children,function(t){return a("el-checkbox",{key:t.id,attrs:{label:t.id}},[e._v(e._s(t.url))])}),1)],1)}),0)}),1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.resourceVisible=!1}}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary",loading:e.formResourceSubmiting},on:{click:e.commitResourceForm}},[e._v("确 定")])],1)],1)},staticRenderFns:[]}},521:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.tableLoading,expression:"tableLoading",modifiers:{body:!0}}],attrs:{data:e.tableData,"element-loading-text":"拼命加载中",border:"",fit:"","highlight-current-row":"","row-key":"id"}},[a("el-table-column",{attrs:{label:"角色名称",align:"left"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._l(t.row.level,function(e){return a("span",{key:e,staticClass:"tree-indent"})}),e._v(" "),t.row.isParent?[t.row.isExpand?a("span",{staticClass:"expand-icon",on:{click:function(a){return e.foldTable(t.row.id)}}},[a("i",{staticClass:"el-icon el-icon-arrow-down"})]):a("span",{staticClass:"expand-icon",on:{click:function(a){return e.expandTable(t.row.id)}}},[a("i",{staticClass:"el-icon el-icon-arrow-right"})])]:e._e(),e._v("\n            "+e._s(t.row.name)+"\n        ")]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"ID",prop:"id",align:"center"}}),e._v(" "),a("el-table-column",{attrs:{label:"角色说明",prop:"desc",align:"center"}}),e._v(" "),a("el-table-column",{attrs:{label:"角色状态",align:"center",width:"100px"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-tag",{attrs:{type:e._f("statusFilter")(t.row.status)}},[e._v(e._s(e._f("statusMap")(t.row.status)))])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"角色类型",align:"center",width:"100px"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-tag",{attrs:{type:e._f("typeFilter")(t.row.type)}},[e._v(e._s(e._f("typeMap")(t.row.type)))])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center",width:"500px"},scopedSlots:e._u([{key:"default",fn:function(t){return[t.row.level?a("el-button",{attrs:{size:"small",type:"warning",icon:"setting"},on:{click:function(a){return e.emitRoleManage(t.row.id,"menu")}}},[e._v("菜单")]):e._e(),e._v(" "),t.row.level?a("el-button",{attrs:{size:"small",type:"success",icon:"setting"},on:{click:function(a){return e.emitRoleManage(t.row.id,"resource")}}},[e._v("资源")]):e._e(),e._v(" "),a("el-button",{attrs:{size:"small",type:"info",icon:"setting"},on:{click:function(a){return e.emitRoleManage(t.row.id,"user")}}},[e._v("用户")]),e._v(" "),t.row.level?a("el-button",{attrs:{size:"small",type:"primary",icon:"edit"},on:{click:function(a){return e.emitRoleUpdate(t.row)}}},[e._v("修改")]):e._e(),e._v(" "),t.row.level?a("el-button",{attrs:{size:"small",type:"danger",icon:"delete"},on:{click:function(a){return e.emitRoleDelete(t.row.id)}}},[e._v("删除")]):e._e(),e._v(" "),t.row.type?a("el-button",{attrs:{size:"small",type:"success",icon:"plus"},on:{click:function(a){return e.emitRoleCreate(t.row.id)}}},[e._v("角色")]):e._e()]}}])})],1)},staticRenderFns:[]}},522:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{directives:[{name:"loading",rawName:"v-loading.body",value:e.menuLoading,expression:"menuLoading",modifiers:{body:!0}}],attrs:{title:"角色菜单管理",visible:e.menuVisible,"element-loading-text":"玩命加载中"},on:{"update:visible":function(t){e.menuVisible=t}}},[a("el-tree",{ref:"tree",attrs:{data:e.menuData,"show-checkbox":"","node-key":"id","default-expanded-keys":e.expandedKeys,"default-checked-keys":e.checkedKeys,props:e.defaultProps}}),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.menuVisible=!1}}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary",loading:e.formMenuSubmiting},on:{click:e.commitMenuForm}},[e._v("确 定")])],1)],1)},staticRenderFns:[]}},523:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{directives:[{name:"loading",rawName:"v-loading.body",value:e.userLoading,expression:"userLoading",modifiers:{body:!0}}],attrs:{title:"角色用户管理",visible:e.userVisible,"element-loading-text":"玩命加载中"},on:{"update:visible":function(t){e.userVisible=t}}},[a("el-transfer",{attrs:{filterable:"","left-default-checked":[],"right-default-checked":[],titles:["未分配用户","已分配用户"],"button-texts":["到左边","到右边"],data:e.userData},model:{value:e.userModel,callback:function(t){e.userModel=t},expression:"userModel"}}),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.userVisible=!1}}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary",loading:e.formUserSubmiting},on:{click:e.commitUserForm}},[e._v("确 定")])],1)],1)},staticRenderFns:[]}},562:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=a(116),i=a.n(n),l=a(340),o=a(298),r=a.n(o),s=a(297),u=a.n(s),c=a(300),d=a.n(c),f=a(299),m=a.n(f);t.default={components:{MenuManage:r.a,ActionManage:u.a,UserManage:d.a,TreeTable:m.a},data:function(){return{statusOptions:[{label:"正常",value:0},{label:"停用",value:1}],typeOptions:[{label:"成员",value:0},{label:"群组",value:1}],total:null,tableData:[],tableLoading:!1,tableQuery:{limit:10,currentPage:1,name:null,status:null,type:null},formTitle:null,formVisible:!1,formSubmiting:!1,createdItem:{id:null,name:null,desc:null,status:0,type:0},deletedForm:{id:null}}},mounted:function(){this.getRoleList()},methods:{getRoleList:function(){var e=this;this.tableLoading=!0,this.$api.system.role.list({data:this.tableQuery}).then(function(t){e.tableData=t.data.data,e.tableLoading=!1}).catch(function(t){e.tableLoading=!1,console.log(t)})},handleFilter:function(){this.getRoleList()},handleReset:function(){this.tableQuery.limit=10,this.tableQuery.currentPage=1,this.tableQuery.name=null,this.tableQuery.status=null,this.tableQuery.type=null,this.getRoleList()},clearDialog:function(){this.createdItem.id=null,this.createdItem.name=null,this.createdItem.desc=null,this.createdItem.status=0,this.createdItem.type=0},createDialog:function(e){this.formVisible=!0,this.clearDialog(),this.formTitle=e?"新建子角色":"新建角色",this.createdItem.parentId=e},updateDialog:function(e){this.formVisible=!0,this.clearDialog(),this.formTitle="修改角色",this.createdItem=i()({},e)},commitForm:function(){var e=this;this.formSubmiting=!0,this.$api.system.role.save({data:this.createdItem}).then(function(t){e.formSubmiting=!1,e.formVisible=!1,e.$notify({title:"成功",message:"保存成功",type:"success",duration:1500}),e.handleFilter(),console.log(t)}).catch(function(t){e.formSubmiting=!1,e.$notify({title:"错误",message:"保存失败",type:"error",duration:3e3}),console.log(t)})},deleteRecord:function(e){var t=this;a.i(l.a)("角色").then(function(){t.deletedForm.id=e,t.$api.system.role.delete({data:t.deletedForm}).then(function(e){t.$notify({title:"成功",message:"删除成功",type:"success",duration:1500}),t.handleFilter(),console.log(e)}).catch(function(e){t.formSubmiting=!1,t.$notify({title:"错误",message:"删除失败",type:"error",duration:3e3}),console.log(e)})})},displayManage:function(e,t){var a=this;this.$nextTick(function(){switch(t){case"menu":a.$refs.menuManage.getRoleMenu(e);break;case"resource":a.$refs.actionManage.getRoleResource(e);break;case"user":a.$refs.userManage.getRoleUser(e)}})}}}},853:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"components-container"},[a("div",{staticClass:"filter-container"},[a("el-select",{staticStyle:{width:"150px"},attrs:{clearable:"",placeholder:"请选择角色状态"},model:{value:e.tableQuery.status,callback:function(t){e.$set(e.tableQuery,"status",t)},expression:"tableQuery.status"}},e._l(e.statusOptions,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}),1),e._v(" "),a("el-select",{staticStyle:{width:"150px"},attrs:{clearable:"",placeholder:"请选择角色类型"},model:{value:e.tableQuery.type,callback:function(t){e.$set(e.tableQuery,"type",t)},expression:"tableQuery.type"}},e._l(e.typeOptions,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}),1),e._v(" "),a("el-input",{staticStyle:{width:"200px"},attrs:{placeholder:"角色名称"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.handleFilter(t)}},model:{value:e.tableQuery.name,callback:function(t){e.$set(e.tableQuery,"name",t)},expression:"tableQuery.name"}}),e._v(" "),a("el-button",{staticStyle:{"margin-left":"10px"},attrs:{type:"primary"},on:{click:e.handleFilter}},[a("i",{staticClass:"el-icon-search"})]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:e.handleReset}},[a("i",{staticClass:"el-icon-refresh"})])],1),e._v(" "),a("tree-table",{attrs:{tableData:e.tableData},on:{manage:e.displayManage,update:e.updateDialog,delete:e.deleteRecord,create:e.createDialog}}),e._v(" "),a("el-dialog",{attrs:{title:e.formTitle,visible:e.formVisible},on:{"update:visible":function(t){e.formVisible=t}}},[a("el-form",{staticClass:"small-space",staticStyle:{width:"60%"},attrs:{model:e.createdItem,"label-position":"left","label-width":"70px"}},[a("el-form-item",{attrs:{label:"角色名称"}},[a("el-input",{attrs:{placeholder:"请填写角色名称"},model:{value:e.createdItem.name,callback:function(t){e.$set(e.createdItem,"name",t)},expression:"createdItem.name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"角色描述"}},[a("el-input",{attrs:{placeholder:"请填写角色描述"},model:{value:e.createdItem.desc,callback:function(t){e.$set(e.createdItem,"desc",t)},expression:"createdItem.desc"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"角色状态"}},[a("el-switch",{attrs:{"inactive-value":1,"active-value":0,"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:e.createdItem.status,callback:function(t){e.$set(e.createdItem,"status",t)},expression:"createdItem.status"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"角色类型"}},[a("el-select",{attrs:{clearable:"",placeholder:"请选择角色类型"},model:{value:e.createdItem.type,callback:function(t){e.$set(e.createdItem,"type",t)},expression:"createdItem.type"}},e._l(e.typeOptions,function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})}),1)],1)],1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.formVisible=!1}}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary",loading:e.formSubmiting},on:{click:e.commitForm}},[e._v("确 定")])],1)],1),e._v(" "),a("menu-manage",{ref:"menuManage"}),e._v(" "),a("action-manage",{ref:"actionManage"}),e._v(" "),a("user-manage",{ref:"userManage"})],1)},staticRenderFns:[]}}});
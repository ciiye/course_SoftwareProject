webpackJsonp([19],{309:function(e,t,o){function r(e){n||o(534)}var n=!1,i=o(2)(o(449),o(530),r,"data-v-2bf29555",null);i.options.__file="D:\\Java_workplace\\Vue-Springboot\\vue--authority-master\\src\\views\\system\\roleOperate\\ActionManage.vue",i.esModule&&Object.keys(i.esModule).some(function(e){return"default"!==e&&"__"!==e.substr(0,2)})&&console.error("named exports are not supported in *.vue files."),i.options.functional&&console.error("[vue-loader] ActionManage.vue: functional components are not supported with templates, they should use render functions."),e.exports=i.exports},449:function(e,t,o){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={data:function(){return{roleId:null,resourceLoading:!1,resourceVisible:!1,formResourceSubmiting:!1,resourceData:[],checkedResourceIds:[],resourceActiveName:"0",resourceActiveIndex:0}},methods:{getRoleResource:function(e){var t=this;this.resourceVisible=!0,this.resourceLoading=!0,this.roleId=e,this.$api.system.role.getResource({data:{id:this.roleId}}).then(function(e){t.resourceData=e.data.data.list,t.checkedResourceIds=e.data.data.checked.map(function(e){return parseInt(e)}),t.resourceLoading=!1}).catch(function(e){t.resourceLoading=!1,console.log(e)})},commitResourceForm:function(){var e=this;this.formResourceSubmiting=!0,this.$api.system.role.savePrivilege({data:{roleId:this.roleId,resourceType:1,resourceIds:this.checkedResourceIds}}).then(function(t){e.formResourceSubmiting=!1,e.resourceVisible=!1,e.$notify({title:"成功",message:"保存成功",type:"success",duration:1500}),console.log(t)}).catch(function(t){e.formResourceSubmiting=!1,e.$notify({title:"错误",message:t,type:"error",duration:3e3}),console.log(t)})}}}},462:function(e,t,o){t=e.exports=o(6)(!1),t.push([e.i,"\n.panel-menu-item[data-v-2bf29555] {\n    width: 90%;\n    max-height: 60px;\n    border-radius: 5px;\n    display: inline-block;\n    margin: 10px 10px 10px 0px;\n}\n.panel-menu-item-title[data-v-2bf29555] {\n    float: left;\n    padding: 5px;\n    margin-right: 10px;\n    border-right: 1px solid #20a0ff;\n}\n.el-checkbox-group[data-v-2bf29555] {\n    display: inline;\n    margin: 5px;\n}\n",""])},530:function(e,t,o){e.exports={render:function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("el-dialog",{directives:[{name:"loading",rawName:"v-loading.body",value:e.resourceLoading,expression:"resourceLoading",modifiers:{body:!0}}],attrs:{title:"角色资源管理",visible:e.resourceVisible,"element-loading-text":"玩命加载中"},on:{"update:visible":function(t){e.resourceVisible=t}}},[o("el-tabs",{model:{value:e.resourceActiveName,callback:function(t){e.resourceActiveName=t},expression:"resourceActiveName"}},e._l(e.resourceData,function(t,r){return o("el-tab-pane",{key:r,attrs:{label:t.title,name:String(r)}},e._l(t.children,function(t,r){return o("div",{key:r,staticClass:"panel-menu-item"},[o("span",{staticClass:"panel-menu-item-title"},[e._v(e._s(t.title))]),e._v(" "),o("el-checkbox-group",{model:{value:e.checkedResourceIds,callback:function(t){e.checkedResourceIds=t},expression:"checkedResourceIds"}},e._l(t.children,function(t){return o("el-checkbox",{key:t.id,attrs:{label:t.id}},[e._v(e._s(t.url))])}),1)],1)}),0)}),1),e._v(" "),o("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[o("el-button",{on:{click:function(t){e.resourceVisible=!1}}},[e._v("取 消")]),e._v(" "),o("el-button",{attrs:{type:"primary",loading:e.formResourceSubmiting},on:{click:e.commitResourceForm}},[e._v("确 定")])],1)],1)},staticRenderFns:[]},e.exports.render._withStripped=!0},534:function(e,t,o){var r=o(462);"string"==typeof r&&(r=[[e.i,r,""]]),r.locals&&(e.exports=r.locals);o(7)("631b52bd",r,!1)}});
//# sourceMappingURL=19.892c010d0a3d51a937f9.js.map
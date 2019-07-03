<template>
    <div class="components-container">
        <div class="filter-container">
            <el-input v-model="tableQuery.name" @keyup.enter.native="handleFilter" style="width: 200px;" placeholder="课程名称"></el-input>
            <el-button style="margin-left: 10px;" @click="handleFilter" type="primary"><i class="el-icon-search"></i></el-button>
            <el-button @click="handleReset" type="primary"><i class="el-icon-refresh"></i></el-button>
            <el-button @click="showDialog('create')" type="primary"><i class="el-icon-plus"></i> 新增签到信息</el-button>
        </div>

        <el-table :data="tableData" v-loading.body="tableLoading" element-loading-text="拼命加载中" stripe border fit highlight-current-row style="width: 100%">
            <el-table-column label="ID" prop="id" align="center"></el-table-column>
            <el-table-column label="课程名称" prop="name" align="center"></el-table-column>
            <el-table-column label="签到状态" prop="status" align="center">
                <template slot-scope="scope">
                    <span>{{ checkStatus[scope.row.status] }}</span>
                </template>
            </el-table-column>
            <el-table-column label="签到学生" prop="student" align="center"></el-table-column>
            <el-table-column label="任课老师" prop="teacher" align="center"></el-table-column>
            <el-table-column label="创建时间" prop="createAt" align="center"></el-table-column>
            <el-table-column label="更新时间" prop="updateAt" align="center"></el-table-column>
            <el-table-column label="操作" align="center">
                <template slot-scope="scope">
                    <el-button size="small" @click="showDialog('update', scope.row)" type="primary"><i class="el-icon-edit"></i> </el-button>
                    <el-button size="small" @click="deleteRecord(scope.row.id)" type="danger"><i class="el-icon-delete"></i> </el-button>
                </template>
            </el-table-column>
        </el-table>

        <div class="pagination-container">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                           :current-page.sync="tableQuery.currentPage" :page-sizes="[10, 20, 50]"
                           :page-size="tableQuery.limit" layout="total, sizes, prev, pager, next, jumper" :total="total">
            </el-pagination>
        </div>

        <el-dialog :title="formTitle" :visible.sync="formVisible" width="45%">
            <el-form :model="createdForm" label-position="left" label-width="70px" style="width: 85%; margin-left:0px;">
                <el-form-item label="课程名称">
                    <el-input v-model="createdForm.name" placeholder="请填写课程名称"></el-input>
                </el-form-item>
                <el-form-item label="签到状态">
                    <el-select v-model="createdForm.status" placeholder="请选择签到状态"  class="input-full">
                        <el-option v-for="(item, index) in checkStatus" :key="index" :label="item" :value="index">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="签到学生">
                    <el-input v-model="createdForm.student" placeholder="请填写签到学生姓名"></el-input>
                </el-form-item>
                <el-form-item label="任课老师">
                    <el-input v-model="createdForm.teacher" placeholder="请填写任课老师"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="formVisible = false">取 消</el-button>
                <el-button type="primary" :loading="formSubmiting" @click="commitForm">确 认</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
    import { confirmBox } from 'utils/message';
    import { isJson } from 'utils';

    export default {
        data() {
            return {
                tableQuery: {
                    limit: 10,
                    currentPage: 1,
                    name: null,
                },
                total: null,
                tableData: [],
                checkStatus: [],
                tableLoading: true,
                formTitle: null,
                formVisible: false,
                formSubmiting: false,
                createdForm: {
                    id: null,
                    name: null,
                    status: null,
                    student: null,
                    teacher: null
                },
                deletedForm: {
                    id: null
                },
            };
        },
        created() {
            this.initParam()
        },
        mounted() {
            this.getList();
        },
        methods: {
            initParam() {
                let paramKeys = ['check_status']
                this.$api.system.config.getParamValue({
                    data: {'names': paramKeys}
                }).then(response => {
                    this.checkStatus = response.data.data.check_status;
                }).catch(error => {
                    console.log(error);
                });
            },
            getList() {
                this.tableLoading = true;
                this.$api.module.check.list({
                    data: this.tableQuery
                }).then(response => {
                    this.total = response.data.data.total;
                    this.tableData = response.data.data.list;
                    this.tableLoading = false;
                }).catch(error => {
                    this.tableLoading = false;
                    console.log(error);
                });
            },
            handleFilter() {
                this.getList();
            },
            handleReset() {
                this.tableQuery.limit = 10;
                this.tableQuery.currentPage = 1;
                this.tableQuery.name = null;

                this.getList();
            },
            handleSizeChange(val) {
                this.tableQuery.limit = val;
                this.getList();
            },
            handleCurrentChange(val) {
                this.tableQuery.currentPage = val;
                this.getList();
            },
            clearDialog() {
                this.createdForm.id = null;
                this.createdForm.name = null;
                this.createdForm.status = null;
                this.createdForm.student = null;
                this.createdForm.teacher = null;
            },
            showDialog(type, row = null) {
                this.formVisible = true;
                this.clearDialog();
                if (type == 'create') {
                    this.formTitle = "新增签到信息";
                } else {
                    this.formTitle = "修改签到信息";
                    Object.assign(this.createdForm, row);
                    if (isJson(this.createdForm.value)) {
                        this.createdForm.value = JSON.parse(this.createdForm.value);
                    }
                }
            },
            commitForm() {
                this.formSubmiting = true;
                this.$api.module.check.save({
                    data: this.createdForm
                }).then(response => {
                    this.formSubmiting = false;
                    this.formVisible = false;
                    this.$notify({
                        title: '成功',
                        message: '保存成功',
                        type: 'success',
                        duration: 1500,
                    });
                    this.handleFilter();
                    console.log(response);
                }).catch(error => {
                    this.formSubmiting = false;
                    this.$notify({
                        title: '错误',
                        message: error,
                        type: 'error',
                        duration: 3000,
                    });
                    console.log(error);
                });
            },
            deleteRecord(id) {
                confirmBox('签到信息').then(() => {
                    this.deletedForm.id = id;
                    this.$api.module.check.delete({
                        data: this.deletedForm
                    }).then(response => {
                        this.$notify({
                            title: '成功',
                            message: '删除成功',
                            type: 'success',
                            duration: 1500,
                        });
                        this.handleFilter();
                        console.log(response);
                    }).catch(error => {
                        this.formSubmiting = false;
                        this.$notify({
                            title: '错误',
                            message: error,
                            type: 'error',
                            duration: 3000,
                        });
                        console.log(error);
                    });
                });
            },
        }
    };
</script>

import createAPI from '../axios'

// 其他管理 API
const module = {
    
    gii: {
        index: config => createAPI('/database/index', 'post', config),
        list: config => createAPI('/database/list', 'post', config),
        tableList: config => createAPI('/table/list', 'post', config),
        generator: config => createAPI('/generator/index', 'post', config),
    },

    //学生信息管理
    student: {
        list: config => createAPI('/admin/student/list', 'post', config),
        save: config => createAPI('/admin/student/save', 'post', config),
        delete: config => createAPI('/admin/student/del', 'delete', config),
    },
    //教师信息管理
    teacher: {
        list: config => createAPI('/admin/teacher/list', 'post', config),
        save: config => createAPI('/admin/teacher/save', 'post', config),
        delete: config => createAPI('/admin/teacher/del', 'delete', config),
    },
    //课程信息管理
    course: {
        list: config => createAPI('/admin/course/list', 'post', config),
        save: config => createAPI('/admin/course/save', 'post', config),
        delete: config => createAPI('/admin/course/del', 'delete', config),
    },
    //签到信息管理
    check: {
        list: config => createAPI('/admin/check/list', 'post', config),
        save: config => createAPI('/admin/check/save', 'post', config),
        delete: config => createAPI('/admin/check/del', 'delete', config),
    },

    //图表数据示例
    chart: {
        example: config => createAPI('/admin/chart/example', 'post', config)
    }
};

export default module;

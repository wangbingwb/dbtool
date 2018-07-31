



<script type="text/javascript">
    $(function () {
        var router = new VueRouter({
            routes:[
                {
                    path: '/',
                    name: 'home',
                    component:Vue.extend({template: '#freemarker'})
                },
                {
                    path: '/',
                    redirect:'/home'
                }
            ]
        });

        var cityOptions = ['上海', '北京', '广州', '深圳'];

        var app = new Vue({
            el: '#app',
            router:router,
            data: {//todo
                activeIndex: "1-1",
                show: true,
                show2: true,
                show3: true,
                radio: '1',
                radio1: '选中且禁用',
                radio2: 3,
                radio3: '上海',
                radio4: '上海',
                radio5: '上海',
                radio6: '上海',
                radio7: '1',
                radio8: '1',
                radio9: '1',
                radio10: '1',
                checked: true,
                checked1: false,
                checked2: true,
                checkList: ['选中且禁用', '复选框 A'],
                checkAll: false,
                checkedCities: ['上海', '北京'],
                cities: cityOptions,
                isIndeterminate: true,
                checkedCities1: ['上海', '北京'],
                checkboxGroup1: ['上海'],
                checkboxGroup2: ['上海'],
                checkboxGroup3: ['上海'],
                checkboxGroup4: ['上海'],
                checked3: true,
                checked4: false,
                checked5: false,
                checked6: true,
                checkboxGroup5: [],
                checkboxGroup6: [],
                input: '',
                input1: '',
                input10: '',
                input2: '',
                input21: '',
                input22: '',
                input23: '',
                textarea: '',
                textarea2: '',
                textarea3: '',
                input3: '',
                input4: '',
                input5: '',
                select: '',
                input6: '',
                input7: '',
                input8: '',
                input9: '',
                state1: '',
                state2: '',
                state3: '',
                restaurants: [],
                state4: '',
                timeout: null,
                num1: 1,
                num2: 1,
                num3: 5,
                num9: 1,
                num4: 1,
                num5: 1,
                num6: 1,
                num7: 1,
                num8: 1,
                vm: {
                    pageNumber: 1,
                    pageSize: 10,
                    totalCount: 15,
                    loading: false,
                },
                options: [{
                    value: '选项1',
                    label: '黄金糕'
                }, {
                    value: '选项2',
                    label: '双皮奶'
                }],
                value: '',
                options2: [{
                    value: '选项1',
                    label: '黄金糕'
                }, {
                    value: '选项2',
                    label: '双皮奶',
                    disabled: true
                }, {
                    value: '选项3',
                    label: '蚵仔煎'
                }, {
                    value: '选项4',
                    label: '龙须面'
                }, {
                    value: '选项5',
                    label: '北京烤鸭'
                }],
                value2: '',
                value3: '',
                value4: '',
                value5: [],
                value11: [],
                cities: [{
                    value: 'Beijing',
                    label: '北京'
                }, {
                    value: 'Shanghai',
                    label: '上海'
                }, {
                    value: 'Nanjing',
                    label: '南京'
                }, {
                    value: 'Chengdu',
                    label: '成都'
                }, {
                    value: 'Shenzhen',
                    label: '深圳'
                }, {
                    value: 'Guangzhou',
                    label: '广州'
                }],
                value6: '',
                options3: [{
                    label: '热门城市',
                    options: [{
                        value: 'Shanghai',
                        label: '上海'
                    }, {
                        value: 'Beijing',
                        label: '北京'
                    }]
                }, {
                    label: '城市名',
                    options: [{
                        value: 'Chengdu',
                        label: '成都'
                    }, {
                        value: 'Shenzhen',
                        label: '深圳'
                    }, {
                        value: 'Guangzhou',
                        label: '广州'
                    }, {
                        value: 'Dalian',
                        label: '大连'
                    }]
                }],
                value7: '',
                value8: '',
                value1: true,
                date: '',
                options4: [],
                value9: [],
                list: [],
                loading: false,
                states: ["Alabama", "Alaska", "Arizona",
                    "Arkansas", "California", "Colorado",
                    "Connecticut", "Delaware", "Florida",
                    "Georgia", "Hawaii", "Idaho", "Illinois",
                    "Indiana", "Iowa", "Kansas", "Kentucky",
                    "Louisiana", "Maine", "Maryland",
                    "Massachusetts", "Michigan", "Minnesota",
                    "Mississippi", "Missouri", "Montana",
                    "Nebraska", "Nevada", "New Hampshire",
                    "New Jersey", "New Mexico", "New York",
                    "North Carolina", "North Dakota", "Ohio",
                    "Oklahoma", "Oregon", "Pennsylvania",
                    "Rhode Island", "South Carolina",
                    "South Dakota", "Tennessee", "Texas",
                    "Utah", "Vermont", "Virginia",
                    "Washington", "West Virginia", "Wisconsin",
                    "Wyoming"],
                options5: [{
                    value: 'HTML',
                    label: 'HTML'
                }, {
                    value: 'CSS',
                    label: 'CSS'
                }, {
                    value: 'JavaScript',
                    label: 'JavaScript'
                }],
                value10: [],
                options3: [{
                    value: 'zhinan',
                    label: '指南',
                    children: [{
                        value: 'shejiyuanze',
                        label: '设计原则',
                        children: [{
                            value: 'yizhi',
                            label: '一致'
                        }, {
                            value: 'fankui',
                            label: '反馈'
                        }, {
                            value: 'xiaolv',
                            label: '效率'
                        }, {
                            value: 'kekong',
                            label: '可控'
                        }]
                    }]
                }, {
                    value: 'zujian',
                    label: '组件',
                    children: [{
                        value: 'basic',
                        label: 'Basic',
                        children: [{
                            value: 'layout',
                            label: 'Layout 布局'
                        }, {
                            value: 'color',
                            label: 'Color 色彩'
                        }]
                    }, {
                        value: 'form',
                        label: 'Form',
                        children: [{
                            value: 'radio',
                            label: 'Radio 单选框'
                        }, {
                            value: 'checkbox',
                            label: 'Checkbox 多选框'
                        }, {
                            value: 'input',
                            label: 'Input 输入框'
                        }]
                    }]
                }, {
                    value: 'ziyuan',
                    label: '资源',
                    children: [{
                        value: 'axure',
                        label: 'Axure Components'
                    }, {
                        value: 'sketch',
                        label: 'Sketch Templates'
                    }, {
                        value: 'jiaohu',
                        label: '组件交互文档'
                    }]
                }],
                options4: [{
                    value: 'zhinan',
                    label: '指南',
                    disabled: true,
                    children: [{
                        value: 'shejiyuanze',
                        label: '设计原则',
                        children: [{
                            value: 'yizhi',
                            label: '一致'
                        }, {
                            value: 'fankui',
                            label: '反馈'
                        }, {
                            value: 'xiaolv',
                            label: '效率'
                        }, {
                            value: 'kekong',
                            label: '可控'
                        }]
                    }]
                }, {
                    value: 'zujian',
                    label: '组件',
                    children: [{
                        value: 'basic',
                        label: 'Basic',
                        children: [{
                            value: 'layout',
                            label: 'Layout 布局'
                        }, {
                            value: 'color',
                            label: 'Color 色彩'
                        }]
                    }, {
                        value: 'form',
                        label: 'Form',
                        children: [{
                            value: 'radio',
                            label: 'Radio 单选框'
                        }, {
                            value: 'checkbox',
                            label: 'Checkbox 多选框'
                        }, {
                            value: 'input',
                            label: 'Input 输入框'
                        }]
                    }]
                }, {
                    value: 'ziyuan',
                    label: '资源',
                    children: [{
                        value: 'axure',
                        label: 'Axure Components'
                    }, {
                        value: 'sketch',
                        label: 'Sketch Templates'
                    }, {
                        value: 'jiaohu',
                        label: '组件交互文档'
                    }]
                }],
                selectedOptions: [],
                selectedOptions2: [],
                selectedOptions3: ['zujian', 'basic', 'layout'],
                options5: [{
                    label: '江苏',
                    cities: []
                }, {
                    label: '浙江',
                    cities: []
                }],
                props: {
                    value: 'label',
                    children: 'cities'
                },
                value15_1: true,
                value15_2: true,
                value15_3: true,
                value15_4: true,
                value15_5: '100',
                value15_6: true,
                value15_7: false,

                value16_1: 0,
                value16_2: 50,
                value16_3: 36,
                value16_4: 48,
                value16_5: 42,
                value16_7: 0,
                value16_6: 0,
                value16_8: 0,
                value16_9: [4, 8],
                value16_10: 0,

                value17_1: '',
                value17_2: new Date(2016, 9, 10, 18, 40),
                value17_3: new Date(2016, 9, 10, 18, 40),
                startTime: '',
                endTime: '',
                value17_4: [new Date(2016, 9, 10, 8, 40), new Date(2016, 9, 10, 9, 40)],
                value17_5: [new Date(2016, 9, 10, 8, 40), new Date(2016, 9, 10, 9, 40)],

                pickerOptions18_1: {
                    disabledDate: function (time) {
                        return time.getTime() > Date.now();
                    },
                    shortcuts: [{
                        text: '今天',
                        onClick: function (picker) {
                            picker.$emit('pick', new Date());
                        }
                    }, {
                        text: '昨天',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24);
                            picker.$emit('pick', date);
                        }
                    }, {
                        text: '一周前',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', date);
                        }
                    }]
                },
                value18_1: '',
                value18_2: '',
                value18_3: '',
                value18_4: '',
                value18_5: '',
                value18_6: [],
                pickerOptions18_2: {
                    shortcuts: [{
                        text: '最近一周',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近一个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近三个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                            picker.$emit('pick', [start, end]);
                        }
                    }]
                },
                value18_6_: '',
                value18_7: '',
                value18_10: '',
                value18_11: '',
                value18_12: '',
                value18_13: [],


                pickerOptions19_1: {
                    disabledDate: function (time) {
                        return time.getTime() > Date.now();
                    },
                    shortcuts: [{
                        text: '今天',
                        onClick: function (picker) {
                            picker.$emit('pick', new Date());
                        }
                    }, {
                        text: '昨天',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24);
                            picker.$emit('pick', date);
                        }
                    }, {
                        text: '一周前',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', date);
                        }
                    }]
                },
                value19_1: '',
                value19_2: '',
                value19_3: '',
                pickerOptions19_2: {
                    shortcuts: [{
                        text: '最近一周',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近一个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近三个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                            picker.$emit('pick', [start, end]);
                        }
                    }]
                },
                value19_4: [new Date(2000, 10, 10, 10, 10), new Date(2000, 10, 11, 10, 10)],
                value19_5: '',
                value19_6: '',
                value19_7: '',

                fileList20: [{
                    name: 'food.jpeg',
                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                }, {
                    name: 'food2.jpeg',
                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                }],
                imageUrl20: '',
                dialogImageUrl20: '',
                dialogVisible20: false,
                fileList20_2: [{
                    name: 'food.jpeg',
                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                }, {
                    name: 'food2.jpeg',
                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                }],
                fileList20_3: [{
                    name: 'food.jpeg',
                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                }, {
                    name: 'food2.jpeg',
                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                }],

                value21_1: null,
                value21_2: null,
                value21_3: null,
                value21_4: null,
                value21_5: 3.7,

                color22_1: '#409EFF',
                color22_2: null,
                color22_3: 'rgba(19, 206, 102, 0.8)',
                color22_5: 'rgba(255, 69, 0, 0.68)',
                predefineColors22_: [
                    '#ff4500',
                    '#ff8c00',
                    '#ffd700',
                    '#90ee90',
                    '#00ced1',
                    '#1e90ff',
                    '#c71585',
                    'rgba(255, 69, 0, 0.68)',
                    'rgb(255, 120, 0)',
                    'hsv(51, 100, 98)',
                    'hsva(120, 40, 94, 0.5)',
                    'hsl(181, 100%, 37%)',
                    'hsla(209, 100%, 56%, 0.73)',
                    '#c7158577'
                ],
                color22_4: '#409EFF',

                data23_: [
                    {
                        key: 1,
                        label: '备选项1',
                        disabled: false
                    },
                    {
                        key: 2,
                        label: '备选项2',
                        disabled: false
                    },
                    {
                        key: 3,
                        label: '备选项3',
                        disabled: true
                    },
                    {
                        key: 4,
                        label: '备选项4',
                        disabled: false
                    }
                ],
                data23_1: [
                    {
                        value: 1,
                        desc: '备选项1',
                        disabled: false
                    },
                    {
                        value: 2,
                        desc: '备选项2',
                        disabled: false
                    },
                    {
                        value: 3,
                        desc: '备选项3',
                        disabled: false
                    },
                    {
                        value: 4,
                        desc: '备选项4',
                        disabled: false
                    }
                ],
                value23_1: [1],
                value23_2: [],
                value23_3: [1],
                value23_4: [1],
                value23_5: [],

                form24_: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                },
                formInline24_: {
                    user: '',
                    region: ''
                },
                labelPosition24_: 'right',
                formLabelAlign24_: {
                    name: '',
                    region: '',
                    type: ''
                },
                ruleForm24_: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                },
                rules: {
                    name: [
                        {required: true, message: '请输入活动名称', trigger: 'blur'},
                        {min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur'}
                    ],
                    region: [
                        {required: true, message: '请选择活动区域', trigger: 'change'}
                    ],
                    date1: [
                        {type: 'date', required: true, message: '请选择日期', trigger: 'change'}
                    ],
                    date2: [
                        {type: 'date', required: true, message: '请选择时间', trigger: 'change'}
                    ],
                    type: [
                        {type: 'array', required: true, message: '请至少选择一个活动性质', trigger: 'change'}
                    ],
                    resource: [
                        {required: true, message: '请选择活动资源', trigger: 'change'}
                    ],
                    desc: [
                        {required: true, message: '请填写活动形式', trigger: 'blur'}
                    ]
                },
                ruleForm24_2: {
                    pass: '',
                    checkPass: '',
                    age: ''
                },
                rules24_2: {
                    pass: [
                        {
                            validator: function (rule, value, callback) {
                                if (!value) {
                                    return callback(new Error('年龄不能为空'));
                                }
                                setTimeout(function () {
                                    if (!Number.isInteger(value)) {
                                        callback(new Error('请输入数字值'));
                                    } else {
                                        if (value < 18) {
                                            callback(new Error('必须年满18岁'));
                                        } else {
                                            callback();
                                        }
                                    }
                                }, 1000);
                            }, trigger: 'blur'
                        }
                    ],
                    checkPass: [
                        {
                            validator: function (rule, value, callback) {
                                if (value === '') {
                                    callback(new Error('请输入密码'));
                                } else {
                                    if (this.ruleForm24_2.checkPass !== '') {
                                        this.$refs.ruleForm24_2.validateField('checkPass');
                                    }
                                    callback();
                                }
                            }, trigger: 'blur'
                        }
                    ],
                    age: [
                        {
                            validator: function (rule, value, callback) {
                                if (value === '') {
                                    callback(new Error('请再次输入密码'));
                                } else if (value !== this.ruleForm24_2.pass) {
                                    callback(new Error('两次输入密码不一致!'));
                                } else {
                                    callback();
                                }
                            }, trigger: 'blur'
                        }
                    ]
                },
                dynamicValidateForm: {
                    domains: [{
                        value: ''
                    }],
                    email: ''
                },
                numberValidateForm: {
                    age: ''
                },
                sizeForm: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                },

                tableData: [{
                    date: '2016-05-03',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 弄',
                    zip: 200333,
                    tag: '家'
                }, {
                    date: '2016-05-02',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 弄',
                    zip: 200333,
                    tag: '家'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 弄',
                    zip: 200333,
                    tag: '家'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 弄',
                    zip: 200333,
                    tag: '家'
                }],
                multipleSelection: [],
                tableData5: [{
                    id: '12987122',
                    name: '好滋好味鸡蛋仔',
                    category: '江浙小吃、小吃零食',
                    desc: '荷兰优质淡奶，奶香浓而不腻',
                    address: '上海市普陀区真北路',
                    shop: '王小虎夫妻店',
                    shopId: '10333'
                }, {
                    id: '12987123',
                    name: '好滋好味鸡蛋仔',
                    category: '江浙小吃、小吃零食',
                    desc: '荷兰优质淡奶，奶香浓而不腻',
                    address: '上海市普陀区真北路',
                    shop: '王小虎夫妻店',
                    shopId: '10333'
                }, {
                    id: '12987125',
                    name: '好滋好味鸡蛋仔',
                    category: '江浙小吃、小吃零食',
                    desc: '荷兰优质淡奶，奶香浓而不腻',
                    address: '上海市普陀区真北路',
                    shop: '王小虎夫妻店',
                    shopId: '10333'
                }, {
                    id: '12987126',
                    name: '好滋好味鸡蛋仔',
                    category: '江浙小吃、小吃零食',
                    desc: '荷兰优质淡奶，奶香浓而不腻',
                    address: '上海市普陀区真北路',
                    shop: '王小虎夫妻店',
                    shopId: '10333'
                }],
                tableData6: [{
                    id: '12987122',
                    name: '王小虎',
                    amount1: '234',
                    amount2: '3.2',
                    amount3: 10
                }, {
                    id: '12987123',
                    name: '王小虎',
                    amount1: '165',
                    amount2: '4.43',
                    amount3: 12
                }, {
                    id: '12987124',
                    name: '王小虎',
                    amount1: '324',
                    amount2: '1.9',
                    amount3: 9
                }, {
                    id: '12987125',
                    name: '王小虎',
                    amount1: '621',
                    amount2: '2.2',
                    amount3: 17
                }, {
                    id: '12987126',
                    name: '王小虎',
                    amount1: '539',
                    amount2: '4.1',
                    amount3: 15
                }],

                tags: [
                    {name: '标签一', type: ''},
                    {name: '标签二', type: 'success'},
                    {name: '标签三', type: 'info'},
                    {name: '标签四', type: 'warning'},
                    {name: '标签五', type: 'danger'}
                ],
                dynamicTags: ['标签一', '标签二', '标签三'],
                inputVisible: false,
                inputValue: '',

                data: [{
                    label: '一级 1',
                    children: [{
                        label: '二级 1-1',
                        children: [{
                            label: '三级 1-1-1'
                        }]
                    }]
                }, {
                    label: '一级 2',
                    children: [{
                        label: '二级 2-1',
                        children: [{
                            label: '三级 2-1-1'
                        }]
                    }, {
                        label: '二级 2-2',
                        children: [{
                            label: '三级 2-2-1'
                        }]
                    }]
                }, {
                    label: '一级 3',
                    children: [{
                        label: '二级 3-1',
                        children: [{
                            label: '三级 3-1-1'
                        }]
                    }, {
                        label: '二级 3-2',
                        children: [{
                            label: '三级 3-2-1'
                        }]
                    }]
                }],
                defaultProps: {
                    children: 'children',
                    label: 'label'
                },
                props: {
                    label: 'name',
                    children: 'zones'
                },
                count: 1,
                props1: {
                    label: 'name',
                    children: 'zones',
                    isLeaf: 'leaf'
                },
                filterText: '',

                currentPage1: 5,
                currentPage2: 5,
                currentPage3: 5,
                currentPage4: 4,

                loading1: true,
                loading2: true,
                fullscreenLoading: false,

                activeIndex36_: '1',
                activeIndex36_2: '1',
                isCollapse: true,

                activeName37_: 'second',
                activeName37_2: 'first',
                tabPosition37_: 'top',
                editableTabsValue37_: '2',
                editableTabs37_: [{
                    title: 'Tab 1',
                    name: '1',
                    content: 'Tab 1 content'
                }, {
                    title: 'Tab 2',
                    name: '2',
                    content: 'Tab 2 content'
                }],
                tabIndex37_: 2,
                editableTabsValue37_2: '2',
                editableTabs37_2: [{
                    title: 'Tab 1',
                    name: '1',
                    content: 'Tab 1 content'
                }, {
                    title: 'Tab 2',
                    name: '2',
                    content: 'Tab 2 content'
                }],

                active40_: 0,

                disabled: true,

                visible43_2: false,

                currentDate44: new Date(),

                activeNames46: ['1'],
            },
            methods: {
                open35_13: function () {
                    this.$notify.success({
                        title: 'Info',
                        message: '这是一条没有关闭按钮的消息',
                        showClose: false
                    });
                },
                open35_12: function () {
                    this.$notify({
                        title: 'HTML 片段',
                        dangerouslyUseHTMLString: true,
                        message: '<strong>这是 <i>HTML</i> 片段</strong>'
                    });
                },
                open35_11: function () {
                    this.$notify({
                        title: '偏移',
                        message: '这是一条带有偏移的提示消息',
                        offset: 100
                    });
                },
                open35_7: function () {
                    this.$notify({
                        title: '自定义位置',
                        message: '右上角弹出的消息'
                    });
                },

                open35_8: function () {
                    this.$notify({
                        title: '自定义位置',
                        message: '右下角弹出的消息',
                        position: 'bottom-right'
                    });
                },

                open35_9: function () {
                    this.$notify({
                        title: '自定义位置',
                        message: '左下角弹出的消息',
                        position: 'bottom-left'
                    });
                },

                open35_10: function () {
                    this.$notify({
                        title: '自定义位置',
                        message: '左上角弹出的消息',
                        position: 'top-left'
                    });
                },
                open35_3: function () {
                    this.$notify({
                        title: '成功',
                        message: '这是一条成功的提示消息',
                        type: 'success'
                    });
                },

                open35_4: function () {
                    this.$notify({
                        title: '警告',
                        message: '这是一条警告的提示消息',
                        type: 'warning'
                    });
                },

                open35_5: function () {
                    this.$notify.info({
                        title: '消息',
                        message: '这是一条消息的提示消息'
                    });
                },

                open35_6: function () {
                    this.$notify.error({
                        title: '错误',
                        message: '这是一条错误的提示消息'
                    });
                },
                open35_: function () {
                    const h = this.$createElement;

                    this.$notify({
                        title: '标题名称',
                        message: h('i', {style: 'color: teal'}, '这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案')
                    });
                },

                open35_2: function () {
                    this.$notify({
                        title: '提示',
                        message: '这是一条不会自动关闭的消息',
                        duration: 0
                    });
                },
                addTab: function (targetName) {
                    let newTabName = ++this.tabIndex + '';
                    this.editableTabs37_2.push({
                        title: 'New Tab',
                        name: newTabName,
                        content: 'New Tab content'
                    });
                    this.editableTabsValue37_2 = newTabName;
                },
                removeTab: function (targetName) {
                    let tabs = this.editableTabs37_2;
                    let activeName = this.editableTabsValue37_2;
                    if (activeName === targetName) {
                        tabs.forEach(function (tab, index) {
                            if (tab.name === targetName) {
                                let nextTab = tabs[index + 1] || tabs[index - 1];
                                if (nextTab) {
                                    activeName = nextTab.name;
                                }
                            }
                        });
                    }
                    this.editableTabsValue37_2 = activeName;
                    this.editableTabs37_2 = tabs.filter(function (tab) {
                        tab.name !== targetName
                    });
                },
                handleTabsEdit: function (targetName, action) {
                    if (action === 'add') {
                        let newTabName = ++this.tabIndex + '';
                        this.editableTabs37_.push({
                            title: 'New Tab',
                            name: newTabName,
                            content: 'New Tab content'
                        });
                        this.editableTabsValue = newTabName;
                    }
                    if (action === 'remove') {
                        let tabs = this.editableTabs37_;
                        let activeName = this.editableTabsValue37_;
                        if (activeName === targetName) {
                            tabs.forEach(function (tab, index) {
                                if (tab.name === targetName) {
                                    let nextTab = tabs[index + 1] || tabs[index - 1];
                                    if (nextTab) {
                                        activeName = nextTab.name;
                                    }
                                }
                            });
                        }

                        this.editableTabsValue = activeName;
                        this.editableTabs = tabs.filter(function (tab) {
                            tab.name !== targetName
                        });
                    }
                },
                handleClick37_: function (tab, event) {
                    console.log(tab, event);
                },
                handleCommand39_: function (command) {
                    this.$message('click on item ' + command);
                },
                handleClick39_: function () {
                    alert('button click');
                },
                next: function () {
                    if (this.active++ > 2) this.active = 0;
                },
                open34_7: function () {
                    this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning',
                        center: true
                    }).then(function () {
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        });
                    }).catch(function () {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        });
                    });
                },
                open34_6: function () {
                    this.$confirm('检测到未保存的内容，是否在离开页面前保存修改？', '确认信息', {
                        distinguishCancelAndClose: true,
                        confirmButtonText: '保存',
                        cancelButtonText: '放弃修改'
                    }).then(function () {
                        this.$message({
                            type: 'info',
                            message: '保存修改'
                        });
                    }).catch(function (action) {
                        this.$message({
                            type: 'info',
                            message: action === 'cancel'
                                    ? '放弃保存并离开页面'
                                    : '停留在当前页面'
                        })
                    });
                },
                open34_5: function () {
                    this.$alert('<strong>这是 <i>HTML</i> 片段</strong>', 'HTML 片段', {
                        dangerouslyUseHTMLString: true
                    });
                },
                open34_4: function () {
                    const h = this.$createElement;
                    this.$msgbox({
                        title: '消息',
                        message: h('p', null, [
                            h('span', null, '内容可以是 '),
                            h('i', {style: 'color: teal'}, 'VNode')
                        ]),
                        showCancelButton: true,
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        beforeClose: function (action, instance, done) {
                            if (action === 'confirm') {
                                instance.confirmButtonLoading = true;
                                instance.confirmButtonText = '执行中...';
                                setTimeout(function () {
                                    done();
                                    setTimeout(function () {
                                        instance.confirmButtonLoading = false;
                                    }, 300);
                                }, 3000);
                            } else {
                                done();
                            }
                        }
                    }).then(function (action) {
                        this.$message({
                            type: 'info',
                            message: 'action: ' + action
                        });
                    });
                },
                open34_3: function () {
                    this.$prompt('请输入邮箱', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
                        inputErrorMessage: '邮箱格式不正确'
                    }).then(function (value) {
                        this.$message({
                            type: 'success',
                            message: '你的邮箱是: ' + value
                        });
                    }).catch(function () {
                        this.$message({
                            type: 'info',
                            message: '取消输入'
                        });
                    });
                },
                open34_2: function () {
                    this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(function () {
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        });
                    }).catch(function () {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        });
                    });
                },
                open34_: function () {
                    this.$alert('这是一段内容', '标题名称', {
                        confirmButtonText: '确定',
                        callback: function (action) {
                            this.$message({
                                type: 'info',
                                message: 'action: ' + action
                            });
                        }
                    });
                },
                openHTML: function () {
                    this.$message({
                        dangerouslyUseHTMLString: true,
                        message: '<strong>这是 <i>HTML</i> 片段</strong>'
                    });
                },
                openCenter: function () {
                    this.$message({
                        message: '居中的文字',
                        center: true
                    });
                },
                open5: function () {
                    this.$message({
                        showClose: true,
                        message: '这是一条消息提示'
                    });
                },

                open6: function () {
                    this.$message({
                        showClose: true,
                        message: '恭喜你，这是一条成功消息',
                        type: 'success'
                    });
                },

                open7: function () {
                    this.$message({
                        showClose: true,
                        message: '警告哦，这是一条警告消息',
                        type: 'warning'
                    });
                },

                open8: function () {
                    this.$message({
                        showClose: true,
                        message: '错了哦，这是一条错误消息',
                        type: 'error'
                    });
                },
                open2: function () {
                    this.$message({
                        message: '恭喜你，这是一条成功消息',
                        type: 'success'
                    });
                },

                open3: function () {
                    this.$message({
                        message: '警告哦，这是一条警告消息',
                        type: 'warning'
                    });
                },

                open4: function () {
                    this.$message.error('错了哦，这是一条错误消息');
                },
                open: function () {
                    this.$message('这是一条消息提示');
                },

                openVn: function () {
                    const h = this.$createElement;
                    this.$message({
                        message: h('p', null, [
                            h('span', null, '内容可以是 '),
                            h('i', {style: 'color: teal'}, 'VNode')
                        ])
                    });
                },
                openFullScreen: function () {
                    this.fullscreenLoading = true;
                    setTimeout(function () {
                        this.fullscreenLoading = false;
                    }, 2000);
                },
                openFullScreen2: function () {
                    const loading = this.$loading({
                        lock: true,
                        text: 'Loading',
                        spinner: 'el-icon-loading',
                        background: 'rgba(0, 0, 0, 0.7)'
                    });
                    setTimeout(function () {
                        loading.close();
                    }, 2000);
                },
                hello: function () {
                    alert('Hello World!');
                },
                handleSizeChange: function (val) {
                    console.log('每页 ${val} 条');
                },
                handleCurrentChange: function (val) {
                    toast.i('当前页: ' + val);
                },
                handleDragStart: function (node, ev) {
                    console.log('drag start', node);
                },
                handleDragEnter: function (draggingNode, dropNode, ev) {
                    console.log('tree drag enter: ', dropNode.label);
                },
                handleDragLeave: function (draggingNode, dropNode, ev) {
                    console.log('tree drag leave: ', dropNode.label);
                },
                handleDragOver: function (draggingNode, dropNode, ev) {
                    console.log('tree drag over: ', dropNode.label);
                },
                handleDragEnd: function (draggingNode, dropNode, dropType, ev) {
                    console.log('tree drag end: ', dropNode && dropNode.label, dropType);
                },
                handleDrop: function (draggingNode, dropNode, dropType, ev) {
                    console.log('tree drop: ', dropNode.label, dropType);
                },
                allowDrop: function (draggingNode, dropNode, type) {
                    if (dropNode.data.label === '二级 3-1') {
                        return type !== 'inner';
                    } else {
                        return true;
                    }
                },
                allowDrag: function (draggingNode) {
                    return draggingNode.data.label.indexOf('三级 3-2-2') === -1;
                },
                filterNode: function (value, data) {
                    if (!value) return true;
                    return data.label.indexOf(value) !== -1;
                },
                append: function (data) {
                    const newChild = {id: id++, label: 'testtest', children: []};
                    if (!data.children) {
                        this.$set(data, 'children', []);
                    }
                    data.children.push(newChild);
                },

                remove: function (node, data) {
                    const parent = node.parent;
                    const children = parent.data.children || parent.data;
                    const index = children.findIndex(function (d) {
                        d.id === data.id
                    });
                    children.splice(index, 1);
                },

                renderContent: function (h, {node, data, store}) {
                    return (
                    '<span class="custom-tree-node">' +
                    '<span>{node.label}</span>' +
                    '<span>' +
                    '<el-button size="mini" type="text" @click="append(data)">Append</el-button>' +
                    '<el-button size="mini" type="text" @click="remove(node, data)">Delete</el-button>' +
                    '</span>' +
                    '</span>');
                },
                getCheckedNodes: function () {
                    console.log(this.$refs.tree.getCheckedNodes());
                },
                getCheckedKeys: function () {
                    console.log(this.$refs.tree.getCheckedKeys());
                },
                setCheckedNodes: function () {
                    this.$refs.tree.setCheckedNodes([{
                        id: 5,
                        label: '二级 2-1'
                    }, {
                        id: 9,
                        label: '三级 1-1-1'
                    }]);
                },
                setCheckedKeys: function () {
                    this.$refs.tree.setCheckedKeys([3]);
                },
                resetChecked: function () {
                    this.$refs.tree.setCheckedKeys([]);
                },
                loadNode1: function (node, resolve) {
                    if (node.level === 0) {
                        return resolve([{name: 'region'}]);
                    }
                    if (node.level > 1) return resolve([]);

                    setTimeout(function () {
                        const data = [{
                            name: 'leaf',
                            leaf: true
                        }, {
                            name: 'zone'
                        }];

                        resolve(data);
                    }, 500);
                },
                loadNode: function (node, resolve) {
                    if (node.level === 0) {
                        return resolve([{name: 'region1'}, {name: 'region2'}]);
                    }
                    if (node.level > 3) return resolve([]);

                    var hasChild;
                    if (node.data.name === 'region1') {
                        hasChild = true;
                    } else if (node.data.name === 'region2') {
                        hasChild = false;
                    } else {
                        hasChild = Math.random() > 0.5;
                    }

                    setTimeout(function () {
                        var data;
                        if (hasChild) {
                            data = [{
                                name: 'zone' + this.count++
                            }, {
                                name: 'zone' + this.count++
                            }];
                        } else {
                            data = [];
                        }
                        resolve(data);
                    }, 500);
                },
                handleCheckChange: function (data, checked, indeterminate) {
                    console.log(data, checked, indeterminate);
                },
                handleNodeClick: function (data) {
                    console.log(data);
                },
                handleClose: function (tag) {
                    this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
                },

                showInput: function () {
                    this.inputVisible = true;
                    this.$nextTick(function () {
                        this.$refs.saveTagInput.$refs.input.focus();
                    });
                },
                handleInputConfirm: function () {
                    let inputValue = this.inputValue;
                    if (inputValue) {
                        this.dynamicTags.push(inputValue);
                    }
                    this.inputVisible = false;
                    this.inputValue = '';
                },
                toggleSelection: function (rows) {
                    if (rows) {
                        rows.forEach(function (row) {
                            this.$refs.multipleTable.toggleRowSelection(row);
                        });
                    } else {
                        this.$refs.multipleTable.clearSelection();
                    }
                },
                handleSelectionChange: function (val) {
                    this.multipleSelection = val;
                },
                indexMethod: function (index) {
                    return index * 2;
                },
                arraySpanMethod: function ({row, column, rowIndex, columnIndex}) {
                    if (rowIndex % 2 === 0) {
                        if (columnIndex === 0) {
                            return [1, 2];
                        } else if (columnIndex === 1) {
                            return [0, 0];
                        }
                    }
                },

                objectSpanMethod: function ({row, column, rowIndex, columnIndex}) {
                    if (columnIndex === 0) {
                        if (rowIndex % 2 === 0) {
                            return {
                                rowspan: 2,
                                colspan: 1
                            };
                        } else {
                            return {
                                rowspan: 0,
                                colspan: 0
                            };
                        }
                    }
                },
                getSummaries: function (param) {
                    const {columns, data} = param;
                    const sums = [];
                    columns.forEach(function (column, index) {
                        if (index === 0) {
                            sums[index] = '总价';
                            return;
                        }
                        const values = data.map(function (item) {
                            Number(item[column.property])
                        });
                        if (!values.every(function (value) {
                                    isNaN(value)
                                })) {
                            sums[index] = values.reduce(function (prev, curr) {
                                const value = Number(curr);
                                if (!isNaN(value)) {
                                    return prev + curr;
                                } else {
                                    return prev;
                                }
                            }, 0);
                            sums[index] += ' 元';
                        } else {
                            sums[index] = 'N/A';
                        }
                    });
                    return sums;
                },

                handleEdit: function (index, row) {
                    console.log(index, row);
                },
                handleDelete: function (index, row) {
                    console.log(index, row);
                },
                filterTag: function (value, row) {
                    return row.tag === value;
                },
                filterHandler: function (value, row, column) {
                    const property = column['property'];
                    return row[property] === value;
                },
                formatter: function (row, column) {
                    return row.address;
                },
                setCurrent: function (row) {
                    this.$refs.singleTable.setCurrentRow(row);
                },
                handleCurrentChange: function (val) {
                    this.currentRow = val;
                },
                deleteRow: function (index, rows) {
                    rows.splice(index, 1);
                },
                handleClick: function (row) {
                    toast.i(row);
                },
                tableRowClassName: function ({row, rowIndex}) {
                    if (rowIndex === 1) {
                        return 'warning-row';
                    } else if (rowIndex === 3) {
                        return 'success-row';
                    }
                    return '';
                },
                removeDomain: function (item) {
                    var index = this.dynamicValidateForm.domains.indexOf(item)
                    if (index !== -1) {
                        this.dynamicValidateForm.domains.splice(index, 1)
                    }
                },
                addDomain: function () {
                    this.dynamicValidateForm.domains.push({
                        value: '',
                        key: Date.now()
                    });
                },
                submitForm: function (formName) {
                    this.$refs[formName].validate(function (valid) {
                        if (valid) {
                            alert('submit!');
                        } else {
                            console.log('error submit!!');
                            return false;
                        }
                    });
                },
                resetForm: function (formName) {
                    this.$refs[formName].resetFields();
                },
                onSubmit: function () {
                    toast.i("submit");
                },
                handleChange: function (value, direction, movedKeys) {
                    console.log(value, direction, movedKeys);
                },
                renderFunc: function (h, option) {
                    console.log(option)
                    return '<span>{{ option.key }} - {{ option.label }}</span>';
                },
                filterMethod: function (query, item) {
                    return item.label.indexOf(query) > -1;
                },
                submitUpload: function () {
                    this.$refs.upload.submit();
                },
                handleChange: function (file, fileList) {
                    this.fileList3 = fileList.slice(-3);
                },
                handlePreview: function (file) {
                    console.log(file);
                },
                handleRemove: function (file, fileList) {
                    console.log(file, fileList);
                },
                handlePictureCardPreview: function (file) {
                    this.dialogImageUrl = file.url;
                    this.dialogVisible = true;
                },
                handleAvatarSuccess: function (res, file) {
                    this.imageUrl = URL.createObjectURL(file.raw);
                },
                beforeAvatarUpload: function (file) {
                    const isJPG = file.type === 'image/jpeg';
                    const isLt2M = file.size / 1024 / 1024 < 2;

                    if (!isJPG) {
                        this.$message.error('上传头像图片只能是 JPG 格式!');
                    }
                    if (!isLt2M) {
                        this.$message.error('上传头像图片大小不能超过 2MB!');
                    }
                    return isJPG && isLt2M;
                },
                handleExceed: function (files, fileList) {
                    this.$message.warning('当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件用户头像上传');
                },
                beforeRemove: function (file, fileList) {
                    return this.$confirm('确定移除 ${ file.name }？');
                },
                formatTooltip: function (val) {
                    return val / 100;
                },
                message: function () {
                    toast.i("我是Vue+Element弹出的消息")
                },
                nextPage: function () {
                    //module实例对象获取data
                    app.$data.value = "new Value";
                },
                handleOpen: function (key, keyPath) {
                    console.log(key, keyPath);
                },
                handleClose: function (key, keyPath) {
                    console.log(key, keyPath);
                },
                handleSelect: function (key, keyPath) {
                    console.log(key, keyPath);
                    this.activeIndex = key
                },
                handleChange: function (value) {
                    console.log(value);
                },
                handleCheckAllChange: function (val) {
                    this.checkedCities = val ? cityOptions : [];
                    this.isIndeterminate = false;
                },
                handleCheckedCitiesChange: function (value) {
                    let checkedCount = value.length;
                    this.checkAll = checkedCount === this.cities.length;
                    this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
                },
                querySearch: function (queryString, cb) {
                    var restaurants = this.restaurants;
                    var results = queryString ? restaurants.filter(this.createFilter(queryString)) : restaurants;
                    // 调用 callback 返回建议列表的数据
                    cb(results);
                },
                querySearchAsync: function (queryString, cb) {
                    var restaurants = this.restaurants;
                    var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;

                    clearTimeout(this.timeout);
                    this.timeout = setTimeout(function () {
                        cb(results);
                    }, 3000 * Math.random());
                },
                createFilter: function (queryString) {
                    return function (restaurant) {
                        return (restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                    };
                },
                createStateFilter: function (queryString) {
                    return function (state) {
                        return (state.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                    };
                },
                loadAll: function () {
                    return [
                        {"value": "三全鲜食（北新泾店）", "address": "长宁区新渔路144号"},
                        {"value": "Hot honey 首尔炸鸡（仙霞路）", "address": "上海市长宁区淞虹路661号"},
                        {"value": "新旺角茶餐厅", "address": "上海市普陀区真北路988号创邑金沙谷6号楼113"},
                        {"value": "泷千家(天山西路店)", "address": "天山西路438号"},
                        {"value": "胖仙女纸杯蛋糕（上海凌空店）", "address": "上海市长宁区金钟路968号1幢18号楼一层商铺18-101"},
                        {"value": "贡茶", "address": "上海市长宁区金钟路633号"},
                        {"value": "豪大大香鸡排超级奶爸", "address": "上海市嘉定区曹安公路曹安路1685号"},
                        {"value": "茶芝兰（奶茶，手抓饼）", "address": "上海市普陀区同普路1435号"},
                        {"value": "十二泷町", "address": "上海市北翟路1444弄81号B幢-107"},
                        {"value": "星移浓缩咖啡", "address": "上海市嘉定区新郁路817号"},
                        {"value": "阿姨奶茶/豪大大", "address": "嘉定区曹安路1611号"},
                        {"value": "新麦甜四季甜品炸鸡", "address": "嘉定区曹安公路2383弄55号"}
                    ];
                },

                handleIconClick: function (ev) {
                    console.log(ev);
                },
                remoteMethod: function (query) {
                    if (query !== '') {
                        this.loading = true;
                        setTimeout(function () {

                            this.loading = false;
                            this.options4 = this.list.filter(function (item) {
                                return item.label.toLowerCase()
                                                .indexOf(query.toLowerCase()) > -1;
                            });
                        }.bind(this), 200);
                    } else {
                        this.options4 = [];
                    }
                },
                handleItemChange: function (val) {
                    console.log('active item:', val);
                    setTimeout(function () {
                        if (val.indexOf('江苏') > -1 && !this.options2[0].cities.length) {
                            this.options2[0].cities = [{
                                label: '南京'
                            }];
                        } else if (val.indexOf('浙江') > -1 && !this.options2[1].cities.length) {
                            this.options2[1].cities = [{
                                label: '杭州'
                            }];
                        }
                    }, 300)
                },
                doAjax: function () {
                    $(function () {
                        $.services.example({}).then(function (data) {
                            if (data.errors.length > 0) {
                                toast.e(data.errors[0].message, 1000);
                            } else {
                                toast.i("Ajax调用成功!", 1000);
                            }
                        })
                    })
                }
            },
            created: function () {
            },
            mounted: function () {
                this.restaurants = this.loadAll();
                this.list = this.states.map(function (item) {
                    return {value: item, label: item};
                });
            },
            watch: {
                'value': function (val, oldVal) {//属性监听
                    toast.i("value=" + val);
                },
                'vm.pageNumber': function (val, oldVal) {//对象属性监听
                    toast.i("pageNumber=" + val);
                },
                'activeIndex': function (val, oldVal) {
                    scrollToTop("#scrollbar .el-scrollbar__wrap");
                },
                'filterText': function (val) {
                    this.$refs.tree2.filter(val);
                }
            }
        });
    });

</script>
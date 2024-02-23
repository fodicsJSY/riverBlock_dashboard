var dateDataChart = echarts.init(document.getElementById('dateData'));

option = {
    legend: {
            orient: 'vertical',
            right: '2%', // 오른쪽으로 이동
            top: 'middle', // 세로 중앙 정렬
            textStyle: {
                color: '#FFFFF' 
            },
            data: ['도림천1', '도림천2', '도림천3', '도림천4', '도림천5', '도림천6', '도림천7', '도림천8', '도림천9', '도림천10']
    },
    grid: {
        left: '3%',
        right: '10%',
        bottom: '5%',
        containLabel: true
    },
    toolbox: {
        feature: {
        saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
    data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
        name: '도림천1',
        type: 'line',
        data: [120, 132, 101, 134, 90, 230, 210, 320, 332, 301, 334, 390, 330, 320, 150, 232, 201, 154, 190, 330],
        itemStyle: {
            color: '#00A9FF'
        }
        },
        {
        name: '도림천2',
        type: 'line',
        data: [220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290, 330, 310],        
        itemStyle: {
            color: '#FFB840'
        }
        },
        {
        name: '도림천3',
        type: 'line',
        data: [150, 232, 201, 154, 190, 330, 410, 220, 182, 191, 234, 290, 330, 310, 82, 32, 91, 34, 129, 133, 132 ],
        itemStyle: {
            color: '#FF5A46'
        }
        },
        {
        name: '도림천4',
        type: 'line',
        data: [320, 332, 301, 334, 390, 330, 320, 150, 232, 201, 154, 190, 330, 320, 332, 301, 334, 390, 330, 320, 150, 232, 201, 154, 190, 330],
        itemStyle: {
            color: '#00BD9F'
        }
        },
        {
        name: '도림천5',
        type: 'line',
        data: [330, 310, 20, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 21, 320, 150, 232, 201, 154, 190, 330],
        itemStyle: {
            color: '#785FFF'
        }
        },
        {
        name: '도림천6',
        type: 'line',
        data: [120, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 210, 320, 332, 301, 334, 390, 330, 320, 150, 232, 201, 154, 190, 330],
        itemStyle: {
            color: '#F28B8C'
        }
        },
        {
        name: '도림천7',
        type: 'line',
        data: [150, 232, 201, 154, 190, 330, 410, 220, 182, 191, 234, 290, 330, 310, 20, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 210],
        itemStyle: {
            color: '#989486'
        }
        },
        {
        name: '도림천8',
        type: 'line',
        data: [150, 232, 201, 154, 190, 330, 410, 220, 182, 191, 234, 290, 330, 310, 20, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 210],
        itemStyle: {
            color: '#516F7D'
        }
        },
        {
        name: '도림천9',
        type: 'line',
        data: [320, 332, 301, 334, 390, 330, 320, 220, 182, 191, 234, 290, 330, 310, 320, 150, 232, 201, 154, 190, 330, 220, 182, 191, 234, 290, 330, 310],
        itemStyle: {
            color: '#28E6EB'
        }
        },
        {
        name: '도림천10',
        type: 'line',
        data: [0, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 210,  220, 182, 191, 234, 290, 330, 310, 20, 132, 101, 134, 90, 230, 232, 201],
        itemStyle: {
            color: '#28695F'
        }
        }
    ]
};




dateDataChart.setOption(option);
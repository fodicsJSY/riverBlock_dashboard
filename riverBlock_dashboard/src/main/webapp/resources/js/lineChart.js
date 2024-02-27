function lineChart(){
    console.log("일별 구동 차트");
    
    var dateDataChart = echarts.init(document.getElementById('dateData'));

    function resizeChart() {
        dateDataChart.resize();
    }

    // 창 크기가 변경될 때 차트 크기를 자동으로 조절
    window.addEventListener('resize', resizeChart);

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
        xAxis: {
            type: 'category',
            boundaryGap: false,
        data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
            name: '도림천1',
            type: 'line',
            data: [120, 13, 101, 34, 90, 230, 210, 320, 332, 301, 334, 390, 330, 320, 150, 232, 201, 154, 190, 330, 220, 182, 191, 234],
            itemStyle: {
                color: '#00A9FF'
            }
            },
            {
            name: '도림천2',
            type: 'line',
            data: [220, 82, 191, 23, 290, 330, 310, 220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290, 330, 310, 220, 182, 191],        
            itemStyle: {
                color: '#FFB840'
            }
            },
            {
            name: '도림천3',
            type: 'line',
            data: [150, 32, 201, 54, 190, 330, 410, 220, 182, 191, 234, 290, 330, 310, 82, 32, 91, 34, 129, 133, 132, 90, 230, 120],
            itemStyle: {
                color: '#FF5A46'
            }
            },
            {
            name: '도림천4',
            type: 'line',
            data: [320, 33, 301, 33, 390, 330, 320, 150, 232, 201, 154, 190, 330, 320, 332, 301, 334, 390, 330, 320, 150, 232, 201, 154],
            itemStyle: {
                color: '#00BD9F'
            }
            },
            {
            name: '도림천5',
            type: 'line',
            data: [330, 31, 20, 13, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 21, 320, 150, 232, 201, 154, 330, 120, 95],
            itemStyle: {
                color: '#785FFF'
            }
            },
            {
            name: '도림천6',
            type: 'line',
            data: [120, 132, 101, 14, 90, 230, 210, 120, 132, 101, 134, 90, 230, 210, 320, 332, 301, 334, 390, 330, 150, 232, 201, 154],
            itemStyle: {
                color: '#F28B8C'
            }
            },
            {
            name: '도림천7',
            type: 'line',
            data: [150, 232, 201, 59, 190, 330, 410, 220, 182, 191, 234, 290, 330, 310, 20, 132, 101, 134, 90, 230, 210, 120, 132, 101],
            itemStyle: {
                color: '#989486'
            }
            },
            {
            name: '도림천8',
            type: 'line',
            data: [150, 232, 201, 50, 98, 410, 220, 182, 191, 234, 290, 330, 310, 20, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134],
            itemStyle: {
                color: '#516F7D'
            }
            },
            {
            name: '도림천9',
            type: 'line',
            data: [320, 332, 301, 64, 390, 330, 320, 220, 182, 191, 234, 290, 330, 310, 320, 150, 232, 201, 154, 190, 220, 182, 191, 234],
            itemStyle: {
                color: '#28E6EB'
            }
            },
            {
            name: '도림천10',
            type: 'line',
            data: [10, 132, 101, 47, 90, 230, 210, 120, 132, 101, 134, 90, 210, 220, 182, 191, 234, 290, 330, 310, 20, 132, 101, 90],
            itemStyle: {
                color: '#28695F'
            }
            }
        ]
    };

    dateDataChart.setOption(option);


}
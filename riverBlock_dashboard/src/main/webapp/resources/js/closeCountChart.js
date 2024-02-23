var closeCountChart = echarts.init(document.getElementById('closeCount'));

option = {

    legend: {
        orient: 'vertical',
        right: 0, // 오른쪽으로 이동
        top: 'middle', // 세로 중앙 정렬
        textStyle: {
            color: '#FFF' 
        }
    },
    series: [
        {
        name: 'Access From',
        type: 'pie',
        radius: ['30%', '80%'],
        avoidLabelOverlap: false,
        itemStyle: {
            borderColor: '#1E1E1E',
            borderWidth: 2
        },
        label: {
            show: true,
            position: 'inside', // 레이블 위치 설정
            formatter: '{c}',
            fontSize: 20, 
        },
        emphasis: {
            label: {
            show: false,
            fontSize: 40,
            fontWeight: 'bold'
            }
        },
        labelLine: {
            show: false
        },
        data: [
            { value: 1048, name: '새벽/오전', itemStyle: { color: '#00A9FF' } },
            { value: 735, name: '점심시간', itemStyle: { color: '#FFB840' } },
            { value: 580, name: '오후', itemStyle: { color: '#FF5A46' } },
            { value: 484, name: '퇴근시간', itemStyle: { color: '#00BD9F' } },
            { value: 300, name: '저녁', itemStyle: { color: '#785FFF' } },
            { value: 350, name: '심야', itemStyle: { color: '#F28B8C' } }
        ]
        }
    ]
};




closeCountChart.setOption(option);
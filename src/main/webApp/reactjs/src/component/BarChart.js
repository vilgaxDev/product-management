import React from 'react';
import {Card} from 'react-bootstrap';
import { Chart } from "react-google-charts";

export default class BarChart extends React.Component{
render(){
    return(
<Card bg='light'>
  <Card.Body>
    <Chart
  chartType="Bar"
  loader={<div>Loading Chart</div>}
  data={[
    ['Year', 'Sales', 'Expenses', 'Profit'],
    
    ['2019', 1170, 460, 250],
    ['2020', 660, 1120, 300],
    ['2018', 1030, 540, 350],
  ]}
  options={{
    // Material design options
    chart: {
      title: 'Company Performance',
      subtitle: 'Sales, Expenses, and Profit: 2019-2020',
    },
  }}
/>
</Card.Body>
</Card>


    );}
}
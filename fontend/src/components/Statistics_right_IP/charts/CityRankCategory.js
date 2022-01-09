import React, { PureComponent } from 'react';
import { CapsuleChart } from '@jiaminghi/data-view-react';
import { cityOption } from './option.js';

class CityRankCategory extends PureComponent {
  constructor(props) {
    super(props);
    this.state = {
      config: {
        // 单位
        unit: '（个）',
        showValue: true,
        data: [],
      },
    };
  }
  render() {
    console.log("这个地方会执行两次")
    const {ityRankCategory } = this.props;
    console.log(ityRankCategory)
    // console.log("2222222222222")
    // console.log(ityRankCategory)
    const config = {
      ...this.state.config,
      ...cityOption(ityRankCategory)
    };
    return (
      <div style = {{height:"100%"}}>
        {ityRankCategory ? (
          <CapsuleChart
            config={config}
            style={{
              // fontSize不起作用
              // width: '5.5rem',
              height: '90%',
              top:'2%'
              // fontSize: "11rem ",
            }}
          />
        ) : (
          ''
        )}
      </div>
    );
  }
}

export default CityRankCategory;

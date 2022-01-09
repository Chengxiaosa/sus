import styled from 'styled-components';
import { TitleColor } from '../../style/color'

export const TopBox = styled.div`
  .top_box {
    display: flex;
    justify-content: center;
    margin-top:0.3rem;
    height:1rem;
    .top_decoration10 {
      position: relative;
      width: 33.3%;
      height: 0.0625rem;
    }

    .top_decoration10_reverse {
      transform: rotateY(180deg);
    }

    .title-box {
      display: flex;
      justify-content: center;

      .top_decoration8 {
        width: 2.5rem;
        height: 0.625rem;
      }

      .title {
        position: relative;
        width: 6.25rem;
        text-align: center;
        background-size: cover;
        background-repeat: no-repeat;

        .title-text {
          text-align: center;
          font-size: 0.38rem;
          bottom: 0;
          color: #fff;
        }

        .top_decoration6 {
          width: 3.125rem;
          height: 0.1rem;
        }

        .title-bototm {
          position: absolute;
          bottom: -0.375rem;
          left: 50%;
          transform: translate(-50%);
        }
      } // end title
    } // end title-box
  } // end top_box
`;

export const TimeBox = styled.div`
  position: absolute;
  right: 0.375rem;
  top: 0.3rem;
  text-align: right;
  color: #fff;
  h3{
    font-size: 0.225rem;
    color: ${TitleColor};
  }
`;


export const HeadBox = styled.div`
  position: absolute;
  left: 0.375rem;
  top: 0.52rem;
  text-align: right;
  color: #fff;
  a{
    font-size: 0.225rem;
    color: ${TitleColor};
  }
`;

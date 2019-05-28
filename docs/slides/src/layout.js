import React, { Fragment } from 'react';
import styled from 'styled-components';

const FragmentWithBackground = styled.div`
  width: 100vw;
  height: 100vh;
  background-color: #292238;
  color: #ffffff;
  background-image: url('images/synthwave_sunset.jpg');
  background-size: 100%;
`;

const Wrapper = styled.main`
  width: 100vw;
  height: 90vh;
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: center;
  position: relative;
`;

const Footer = styled.header`
  font-size: 1em;
  color: black;
  padding: 15px 30px;
  text-align: right;
  width: 100vw;
  display: flex;
  align-items: center;
  justify-content: space-between;
`;

const AvatarImg = styled.img`
  width: 1.5em;
  height: 1.5em;
  border-radius: 50%;
  border: 2px solid #ffffff;
`;

const DivRight = styled.div`
  display: flex;
  text-justify: right;
  justify-content: space-between;
`;

const SpanHighlight = styled.span`
  margin-left: 0.2em;
  margin-right: 1em;
  font-weight: 800;
  color: #ffffff;
  #-webkit-text-stroke: 1px #ffffff;
`;

const TwitterAvatar = ({ src, handle }) => (
  <div style={{ display: 'flex', alignItems: 'center' }}>
    <AvatarImg src={src} />
    <SpanHighlight>{handle}</SpanHighlight>
  </div>
);

const Layout = ({ children }) => (
  <FragmentWithBackground>
    <Wrapper>{children}</Wrapper>
    <Footer>
      <DivRight>
        <TwitterAvatar
          handle="@saramic"
          src="images/michael_milewski_twitter.jpg"
        />
      </DivRight>
    </Footer>
  </FragmentWithBackground>
);

export default Layout;

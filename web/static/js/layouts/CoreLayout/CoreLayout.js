import React from 'react'
import HeaderContainer from '../../containers/HeaderContainer'
import Footer from '../../components/Footer/Footer'
import './CoreLayout.scss'
import '../../styles/core.scss'

export const CoreLayout = ({ children }) => (
  <div className='container text-center'>
    <HeaderContainer />
    <div className='core-layout__viewport'>
      {children}
    </div>
    <Footer />
  </div>
)

CoreLayout.propTypes = {
  children : React.PropTypes.element.isRequired
}

export default CoreLayout

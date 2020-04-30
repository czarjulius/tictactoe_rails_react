import axios from 'axios';

    const  axiosInstance = ({path, method = 'post', data}) => {
      return axios( {url:`http://localhost:3000/${path}`, method, data} )
        .then(res => {
            return res.data;
        }).catch(({ message, response }) => {
          if(response) {
            return response.data
          }
          return message;
        })
    };
  export default axiosInstance
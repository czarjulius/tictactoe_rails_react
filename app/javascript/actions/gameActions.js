import axios from 'axios';
import 'dotenv/config';

    const  axiosInstance = ({path, method = 'post', data}) => {      
      return axios( {url:process.env.BASE_URL+path, method, data} )
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
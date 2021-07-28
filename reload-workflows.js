const axios = require('axios')
const id = process.env.N8N_DEPLOY_RELOAD_WORKFLOW_ID || 18
axios.get(`http://localhost:5678/rest/workflows/${id}`, {
  auth: {
    username: process.env.N8N_BASIC_AUTH_USER,
    password: process.env.N8N_BASIC_AUTH_PASSWORD
  }
}).then(function(res){
  axios.post('http://localhost:5678/rest/workflows/run', {
    workflowData: res.data.data
  },{
    auth: {
      username: process.env.N8N_BASIC_AUTH_USER,
      password: process.env.N8N_BASIC_AUTH_PASSWORD
    }
  });
});

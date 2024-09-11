import axios from 'axios';

//set environment variable for the URL or uses localhost by default
const baseURL = process.env.BASE_URL || 'http://localhost:8080';

export async function sendHooverRequest(payload) {
  try {
    return await axios.post(baseURL + '/v1/cleaning-sessions', payload);
  } catch (err) {
    return err.response;
  }
}

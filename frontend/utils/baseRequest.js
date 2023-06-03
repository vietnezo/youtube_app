import axios from 'axios'

const instance = axios.create({
  baseURL: process.env.API_URL,
})
if (typeof window != 'undefined') {
  instance.defaults.headers.common['token'] = localStorage.getItem('access_token')
}

export const get = async (url, params = {}) => {
  try {
    const config = { params: params }
    const response = await instance.get(url, config)
    return _responseHandler(response)
  } catch (error) {
    return _errorHandler(error)
  }
}

export const put = async (url, data = {}) => {
  try {
    let response = {}
    if (data.toLocaleString() === '[object FormData]') {
      response = await instance.put(url, data)
    } else {
      response = await instance.put(url, data, {
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
      })
    }
    return _responseHandler(response)
  } catch (error) {
    _errorHandler(error)
  }
}

export const post = async (url, data = {}) => {
  try {
    const response = await instance.post(url, data)
    if (typeof window != 'undefined' && response.headers.authorization) {
      localStorage.setItem('access_token', response.headers.authorization)
    }
    return _responseHandler(response)
  } catch (error) {
    _errorHandler(error)
  }
}

export const del = async (url, data = {}) => {
  try {
    const response = await instance.delete(url, { data })
    return _responseHandler(response)
  } catch (error) {
    _errorHandler(error)
  }
}

const _responseHandler = (response, url) => {
  const data = response.data
  return data
}

const _errorHandler = (err) => {
  if (err.response && err.response.status === 401) {
    // todo
  }
  throw err
}

"use client"

import React, { useEffect, useState } from 'react'
import { get } from '@/utils/baseRequest'
import styles from '@/styles/home.module.css'

export default function Home() {
  const [movies, setMovies] = useState([])
  
  const getMovies = async () => {
    try {
      const movies = await get()
      setMovies(movies)
    } catch (error) {
      
    }
  }

  return (
    <main className={styles.main}>
      
    </main>
  )
}

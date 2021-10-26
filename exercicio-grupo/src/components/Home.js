import React from 'react';
import Emojis from './Emojis';

function Home() {
  return (
    <>
      <header align="center">
        <h1>Reações ao vídeo</h1>
      </header>
      <div align="center">
      <iframe
        title="video"
        width="75%"
        height="443"
        src="http://www.youtube.com/embed/pgHr6luyjjs?rel=0&controls=0&hd=1&showinfo=0&enablejsapi=1" />
      </div>
      <Emojis />
    </>
  );
}

export default Home;
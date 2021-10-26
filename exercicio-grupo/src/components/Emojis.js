import React from 'react';
import coracao from '../images/coracao.png';
import surpreso from '../images/surpreso.png';
import feliz from '../images/feliz.png';
import carafechada from '../images/carafechada.png';
import io from "socket.io-client";
import { useState, useEffect } from "react";

const socket = io.connect("http://localhost:4000");

function Emojis() {
  const [voteHearth, setVoteHearth] = useState(0);

  function handleHearth() {
    socket.emit('updateVote', voteHearth);
  }

  useEffect(() => {
    socket.on('updateState', (newAmountVote) => {
      setVoteHearth(newAmountVote);
    });
  }, [voteHearth]);
  
  return (
    <div align="center" display="flex" flex-direction="row">
      <div>
        <p>{voteHearth}</p>
        <img onClick={() => handleHearth()} src={ coracao } alt="coracao" />
      </div>
      <div>
        <p>0</p>
        <img src={ surpreso } alt="surpreso" />
      </div>
      <div>
        <p>0</p>
        <img src={ feliz } alt="feliz" />
      </div>
      <div>
        <p>0</p>
        <img src={ carafechada } alt="carafechada" />
      </div>
    </div>
  );
}

export default Emojis;
const sinon = require('sinon');
const { expect } = require('chai');
const { MongoClient } = require('mongodb');
const { MongoMemoryServer } = require('mongodb-memory-server');

const mongoConnection = require('../../models/connection');
const MoviesModel = require('../../models/movieModel');

let connectionMock; 

before(async () => {
  const DBServer = new MongoMemoryServer();
  const URLMock = await DBServer.getUri();

  connectionMock = await MongoClient
    .connect(URLMock, {
      useNewUrlParser: true,
      useUnifiedTopology: true
    })
    .then((conn) => conn.db('model_example'));

  console.log(connectionMock);
  sinon.stub(mongoConnection, 'getConnection').resolves(connectionMock);
});

console.log(connectionMock);
/* Restauraremos a função `getConnection` original após os testes. */
after(() => {
  mongoConnection.getConnection.restore();
});

describe('Insere um novo filme no BD', () => {
  const payloadMovie = {
    title: 'Example Movie',
    directedBy: 'Jane Dow',
    releaseYear: 1999,
  }

  describe('quando é inserido com sucesso', () => {
    it('retorna um objeto', async () => {
      const response = await MoviesModel.create(payloadMovie);

      expect(response).to.be.a('object')
    });

    it('tal objeto possui o "id" do novo filme inserido', async () => {
      const response = await MoviesModel.create(payloadMovie);

      expect(response).to.have.a.property('id')
    });

    it('deve existir um filme com o título cadastrado!', async () => {
      await MoviesModel.create(payloadMovie);
      const movieCreated = await connectionMock.collection('movies').findOne({ title: payloadMovie.title });
      expect(movieCreated).to.be.not.null;
    });
  });
});
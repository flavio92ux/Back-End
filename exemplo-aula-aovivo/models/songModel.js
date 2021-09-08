const { ObjectId } = require('bson');
const getConnection = require('./connection');

const getAll = async () => {
  const db = await getConnection();
  const songs = await db.collection('authors').find({}).toArray();
  return songs;
};

const getById = async (id) => {
  if (!ObjectId.isValid(id)) return null;

  const db = await getConnection(); 
  const song = await db.collection('authors').findOne({ _id: ObjectId(id) });
  return song;
};

const create = async (firstName, middleName, lastName) => {
  const db = await getConnection();
  const result = await db.collection('authors').insertOne({ firstName, middleName, lastName });
  return { id: result.insertedId, firstName, middleName, lastName };
};

const remove = async (id) => {
  const db = await getConnection();
  await db.collection('authors').deleteOne({ _id: ObjectId(id) });
};

module.exports = {
  getAll,
  getById,
  create,
  remove,
}
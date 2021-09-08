const songModel = require('../models/songModel');

const HTTP_OK_STATUS = 200;
const HTTP_CREATED_STATUS = 201;
const HTTP_NO_BODY_STATUS = 402;
const HTTP_NOT_FOUND = 404;

const getAll = async (_req, res) => {
  const songs = await songModel.getAll();
  res.status(HTTP_OK_STATUS).json(songs);
};

const getById = async (req, res) => {
  const { id } = req.params;
  const songs = await songModel.getById(id);
  res.status(HTTP_OK_STATUS).json(songs);
}

const createAuthor = async (req, res) => {
  const { firstName, middleName, lastName } = req.body;

  const created = await songModel.create(firstName, middleName, lastName);

  res.status(HTTP_CREATED_STATUS ).json(created);
};

const deleteAuthor = async (req, res) => {
  const song = await songModel.getById(req.params.id);

  if (!song) {
    return res.status(HTTP_NOT_FOUND).json({ message: "not found" });
  }

  await songModel.remove(id);

  res.status(HTTP_NO_BODY_STATUS).end();
};

module.exports = {
  getAll,
  getById,
  createAuthor,
  deleteAuthor,
};
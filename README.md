# ESIM - Enhanced Sequential Inference Model

## The Model
This NLI model utilizes the Enhanced Sequential Inference Model (**ESIM**) architecture, specifically designed to process and relate pairs of sentences for tasks like entailment and contradiction. The ESIM architecture employs bi-directional Long Short-Term Memory (BiLSTM) networks to encode the sentences deeply. It enhances inference capabilities through an attention mechanism that compares and contrasts the encoded representations.

It was trained on the provided NLI dataset.

## Credits
The choice of architecture was inspired by ESIM’s success on the [SNLI benchmark](https://paperswithcode.com/paper/enhanced-lstm-for-natural-language-inference).
The architecture is described in the following [paper](https://arxiv.org/pdf/1609.06038.pdf).
Implementation is based off the following [repo](https://github.com/coetaur0/ESIM?tab=readme-ov-file).

## Installation

1. (Optional) Create a python virtual environment. The Python version used by this repository was 3.9.6. The commands I use are the following where `micromamba` can be replaced with `conda` if that's what you're using.
```shell
micromamba create -p './.venv' python=3.9.6 -c conda-forge
```
```shell
micromamba activate ./.venv
```
2. Install the dependencies with:
```shell
pip install -r requirements.txt
```

## Preparation

### Data

You must fetch the `train.csv`, `dev.csv` and `test.csv` data and place it under `./data/dataset/`.

### Model

As the model takes a while to train it has been uploaded to [google drive](https://drive.google.com/file/d/1Nj8_L2Wp-TwDcDcYlWe0zMSRlxtnLLY2/view?usp=sharing) to save you the time. Once downloaded it should be placed under `./data/checkpoints/`.

## Usage

### Inference (Demo Code)

To perform inferene simply step through the `./demo.ipynb` Jupter notebook.

### General

**Important**: all scripts should be run from the project root as Python modules (`-m`).

#### Preprocess the data
Before the downloaded corpus and embeddings can be used in the ESIM model, they need to be preprocessed. This can be done with
the *preprocess.py* script in the *scripts/preprocessing* folder of this repository.

The scripts' usage is the following:
```
python -m scripts.preprocessing.preprocess [-h] [--config CONFIG]
```
where `config` is the path to a configuration file defining the parameters to be used for preprocessing. Default 
configuration files can be found in the *config/preprocessing* folder of this repository.

#### Train the model
The *train.py* scripts in the *scripts/training* folder can be used to train the ESIM model on some training data and 
validate it on some validation data.

The script's usage is the following:
```
python -m scripts.training.train [-h] [--config CONFIG] [--checkpoint CHECKPOINT]
```
where `config` is a configuration file (default one is located in the *config/training* folder), and `checkpoint` is an 
optional checkpoint from which training can be resumed. Checkpoints are created by the script after each training epoch, with 
the name *esim_\*.pth.tar*, where '\*' indicates the epoch's number.

#### Test the model
The *test.py* scripts in the *scripts/testing* folder can be used to test a pretrained ESIM model on some test data.

The script's usage is the following:
```
test.py [-h] test_data checkpoint
```
where `test_data` is the path to some preprocessed test set, and `checkpoint` is the path to a checkpoint produced by the 
*train.py* script (either one of the checkpoints created after the training epochs, or the best model seen during 
training, which is saved in *data/checkpoints/best.pth.tar* - the difference between the *esim_\*.pth.tar* files and 
*best.pth.tar* is that the latter cannot be used to resume training, as it doesn't contain the optimizer's state).

The output of the script is a `predictions.csv` file with a single `prediction` column containing either `0` or `1` signifying the prediction being neutral or an entailment respectively.

#### Evaluate the model
The *evaluate.py* scripts in the *scripts/evaluate* folder can be used to evaluate a model on data which has ground truth data available in a `label` column marked either as `0` or `1` with the same meaning as described above.

The script's usage is the following:
```
evaluate.py [-h] data predictions
```
where `data` is the path to some data with the ground truth column available, and `predictions` is the output of the `test.py` script.

The output of the script is the performance of the model across the following metrics:
- Accuracy
- Macro Precision
- Macro Recall
- Macro F1 Score
- Weighted Precision
- Weighted Recall
- Weighted F1 Score
- Matthews Correlation Coefficient (MCC)


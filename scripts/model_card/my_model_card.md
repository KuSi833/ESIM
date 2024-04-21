---
{}
---
language: en
license: cc-by-4.0
tags:
- text-classification
repo: https://github.com/KuSi833/ESIM

---

# Model Card for r90461cc-e14912km-NLI

<!-- Provide a quick summary of what the model is/does. -->

This model extends the ESIM architecture for the Natural Language Inference task, 
    aiming to determine if one sentence logically follows from another.


## Model Details

### Model Description

<!-- Provide a longer summary of what this model is. -->

This model is based on the ESIM architecture, enhanced for better performance 
    in sequential inference tasks. It utilizes attention mechanisms and recurrent neural networks.

- **Developed by:** Claudiu Crăciun and Karlo Milicic
- **Language(s):** English
- **Model type:** Supervised
- **Model architecture:** RNN with attention mechanisms

### Model Resources

<!-- Provide links where applicable. -->

- **Repository:** https://github.com/coetaur0/ESIM
- **Paper or documentation:** https://arxiv.org/pdf/1609.06038.pdf

## Training Details

### Training Data

<!-- This is a short stub of information on the training data that was used, and documentation related to data pre-processing or additional filtering (if applicable). -->

More than 26K premise-hypothesis pairs are used for validation/testing

### Training Procedure

<!-- This relates heavily to the Technical Specifications. Content here should link to that section when it is relevant to the training procedure. -->

#### Training Hyperparameters

<!-- This is a summary of the values of hyperparameters used in training the model. -->


    - learning_rate: 0.0004
    - train_batch_size: 32
    - eval_batch_size: 32
    - seed: 42
    - hidden_size: 300
    - dropout: 0.5
    - num_epochs: 64
    - patience: 5
    - max_gradient_norm: 10.0
    

#### Speeds, Sizes, Times

<!-- This section provides information about how roughly how long it takes to train the model and the size of the resulting model. -->


    - overall training time: 54.5611s
    - duration per training epoch: 9 min 3 s
    - model size: 92MB

## Evaluation

<!-- This section describes the evaluation protocols and provides the results. -->

### Testing Data & Metrics

#### Testing Data

<!-- This should describe any evaluation data used (e.g., the development/validation set provided). -->

More than 6K premise-hypothesis pairs are used for validation/testing

#### Metrics

<!-- These are the evaluation metrics being used. -->


    - Accuracy
    - Macro Precision
    - Macro Recall
    - Macro F1 Score
    - Weighted Precision
    - Weighted Recall
    - Weighted F1 Score
    - Matthews Correlation Coefficient (MCC)
    

### Results


    - Accuracy: 70.11%
    - Macro Precision: 70.42%
    - Macro Recall: 69.85%
    - Macro F1 Score: 69.79%
    - Weighted Precision: 70.36%
    - Weighted Recall: 70.11%
    - Weighted F1 Score: 69.89%
    - Matthews Correlation Coefficient (MCC): 40.27%
    

## Technical Specifications

### Hardware


    - RAM: at least 8 GB
    - Storage: at least 2GB,
    - GPU: V100

### Software


    - Pytorch 1.11.0+cuda11.3+cudnn8

## Bias, Risks, and Limitations

<!-- This section is meant to convey both technical and sociotechnical limitations. -->

The model may exhibit biases inherent in the training data.

## Additional Information

<!-- Any other information that would be useful for other people to know. -->

The hyperparameters were selected based on a grid search to optimize performance on the validation set.

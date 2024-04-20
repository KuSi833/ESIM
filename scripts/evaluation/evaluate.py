import argparse
import pandas as pd
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    matthews_corrcoef,
)


def main(data_path, predictions_path):
    data_df = pd.read_csv(data_path)
    predictions_df = pd.read_csv(predictions_path)

    labels = data_df["label"]
    predictions = predictions_df["prediction"]

    accuracy = accuracy_score(labels, predictions)
    macro_precision = precision_score(labels, predictions, average='macro')
    macro_recall = recall_score(labels, predictions, average='macro')
    macro_f1 = f1_score(labels, predictions, average='macro')
    weighted_precision = precision_score(labels,
                                         predictions,
                                         average='weighted')
    weighted_recall = recall_score(labels, predictions, average='weighted')
    weighted_f1 = f1_score(labels, predictions, average='weighted')
    mcc = matthews_corrcoef(labels, predictions)

    print(f"Accuracy: {accuracy * 100:.2f}%")
    print(f"Macro Precision: {macro_precision * 100:.2f}%")
    print(f"Macro Recall: {macro_recall * 100:.2f}%")
    print(f"Macro F1 Score: {macro_f1 * 100:.2f}%")
    print(f"Weighted Precision: {weighted_precision * 100:.2f}%")
    print(f"Weighted Recall: {weighted_recall * 100:.2f}%")
    print(f"Weighted F1 Score: {weighted_f1 * 100:.2f}%")
    print(f"Matthews Correlation Coefficient (MCC): {mcc * 100:.2f}%")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Evaluate the model performance")
    parser.add_argument("data", help="Path to a file with labels")
    parser.add_argument("predictions", help="Path to predictions")
    args = parser.parse_args()

    main(args.data, args.predictions)

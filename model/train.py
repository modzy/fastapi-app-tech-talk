from sklearn import datasets
from sklearn.svm import SVC
import pickle

# Import data
iris = datasets.load_iris()

# Train support vector machine model
clf = SVC(probability=True)
model = clf.fit(iris.data, iris.target)

test_predictions = list(model.predict(iris.data[[1,57,105]]))
output = list(iris.target_names[test_predictions])
print(output)

# Save model as pickle file
model_fname = open("classifier.pkl", "wb")
pickle.dump(model, model_fname)
#include <iostream>
#include <fstream>
#include <vector>
#include <unordered_map>
#include <string>
#include <cmath>

using namespace std;

// Fingerprint struct
struct Fingerprint
{
  string hashValue;
  int position;
};

// Read tokenized submissions from tokens.txt
vector<string> readTokenizedSubmissions(const string& filename)
{
  vector<string> submissions;
  ifstream file(filename);
  if (file.is_open())
  {
    string line;
    while (getline(file, line))
    {
      submissions.push_back(line);
    }
    file.close();
  }
  else
  {
    cerr << "Unable to open file: " << filename << endl;
  }
  return submissions;
}

// Function to generate fingerprints from tokenized submissions
vector<Fingerprint> generateFingerprints(const string& submission)
{
  vector<Fingerprint> fingerprints;
  // Define your sliding window size
  int windowSize = 10;
  // Define your hash function (you can use any hash function you like)
  auto hashFunction = [](const string& str)
    {
      // Simple hash function for demonstration purposes
      int hash = 0;
      for (char c : str)
      {
        hash = (hash * 31 + c) % 1000000007; // Adjust modulus as needed
      }
      return to_string(hash);
    };

  for (int i = 0; i <= submission.length() - windowSize; ++i)
  {
    string window = submission.substr(i, windowSize);
    string hashValue = hashFunction(window);
    fingerprints.push_back({ hashValue, i });
  }
  return fingerprints;
}

// Function to compare fingerprints and detect similarities
void detectSimilarities(const vector<Fingerprint>& fingerprints1, const vector<Fingerprint>& fingerprints2)
{
  // Define your similarity threshold
  double similarityThreshold = 0.8;
  // Calculate the number of matching fingerprints required for similarity
  int matchingThreshold = ceil(similarityThreshold * min(fingerprints1.size(), fingerprints2.size()));

  unordered_map<string, int> fingerprintCounts;

  // Count the occurrences of each fingerprint in the first set
  for (const auto& fingerprint : fingerprints1)
  {
    fingerprintCounts[fingerprint.hashValue]++;
  }

  int matchingFingerprints = 0;

  // Check for matching fingerprints in the second set
  for (const auto& fingerprint : fingerprints2)
  {
    if (fingerprintCounts[fingerprint.hashValue] > 0)
    {
      matchingFingerprints++;
    }
  }

  // Output similarity result
  if (matchingFingerprints >= matchingThreshold)
  {
    cout << "Similarity Detected: " << (double)matchingFingerprints / min(fingerprints1.size(), fingerprints2.size()) << endl;
  }
  else
  {
    cout << "No Similarity Detected" << endl;
  }
}

// int main()
// {
//   return 0;
// }

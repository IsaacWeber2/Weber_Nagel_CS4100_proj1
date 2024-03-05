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
vector<string> readTokenizedSubmissions(const string &filename)
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
vector<Fingerprint> generateFingerprints(const string &submission)
{
  vector<Fingerprint> fingerprints;
  // Define your sliding window size
  int windowSize = 10;
  // Define your hash function (you can use any hash function you like)
  auto hashFunction = [](const string &str)
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
    fingerprints.push_back({hashValue, i});
  }
  return fingerprints;
}

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

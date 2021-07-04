#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <openssl/crypto.h>
#include <openssl/md5.h>
#include <string>
#include <string_view>
#include <unistd.h>

static std::string target_hash = "14754f13e5280c5d49d2ae536c2d57e2";

int main() {
  setreuid(geteuid(), -1);

  std::string username, password;

  system("echo -n 'Username: '");
  std::cin >> username;

  std::cout << "Password: ";
  std::cin >> password;

  if (username != "dev") {
    std::cerr << "User not found!" << std::endl;
    return 1;
  }

  // Hash the password
  std::uint8_t digest[MD5_DIGEST_LENGTH];
  MD5((const unsigned char *)password.data(), password.length(), digest);

  // Base16 encode the digest
  auto hexencoded = OPENSSL_buf2hexstr(digest, sizeof(digest));

  if (target_hash != hexencoded) {
    std::cerr << "Wrong password, this incident will be reported.\n";
    std::cerr << "Reason: Got hash " << std::string_view(hexencoded)
              << " which does not match the target hash" << std::endl;
    return 2;
  }

  char *const argv[] = {"/bin/bash", NULL};
  return execv(argv[0], argv);
}

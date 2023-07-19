import React, {useEffect, useState} from 'react';
import {Text, View} from 'react-native';

function App(): JSX.Element {
  const [userData, setUserData] = useState(null);

  useEffect(() => {
    fetch('https://api.github.com/users/brscherer')
      .then(response => response.json())
      .then(data => setUserData(data))
      .catch(error => console.log(error));
  }, []);

  if (!userData) {
    return (
      <View>
        <Text>Loading...</Text>
      </View>
    );
  }

  return (
    <View>
      <Text>Username: {userData.login}</Text>
      <Text>Name: {userData.name}</Text>
      <Text>Location: {userData.location}</Text>
    </View>
  );
}

export default App;

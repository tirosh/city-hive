<template>
  <div class="box">
    <h2 class="mb-5">Potential hobby partners</h2>
    <button class="button is-warning mb-5" @click="findHobbyPartners">
      Find {{ matchedUser ? 'another' : '' }} Hobby Partner
    </button>
    <div v-if="buttonClicked && matchedUser">
      <p>{{ [matchedUser.first_name, matchedUser.last_name].join(' ') }}</p>
    </div>
    <div v-if="buttonClicked && !matchedUser">
      <p>No matching hobby partner found.</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      buttonClicked: false,
      matchedUser: null,
    };
  },
  methods: {
    findHobbyPartners() {
      this.buttonClicked = true;

      fetch('/pages/find_hobby_partners')
        .then(response => response.json())
        .then(data => {
          this.matchedUser = data;
        })
        .catch(error => {
          console.error('Error fetching hobby partner:', error);
        });
    },
  },
};
</script>

<style scoped>
</style>

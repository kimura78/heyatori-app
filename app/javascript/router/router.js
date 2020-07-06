import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import GroupNew from '../views/GroupNew.vue'
import GroupShow from '../views/GroupShow.vue'
import RoomIndex from '../views/RoomIndex.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/',  name: 'Home', component: Home },
  { path: '/groups/new', name: 'GroupNew', component: GroupNew },
  { path: '/groups/:id', name: 'GroupShow', component: GroupShow },
  { path: '/groups/:id/:day', name: 'RoomIndex', component: RoomIndex },
];

export default new VueRouter({ routes });